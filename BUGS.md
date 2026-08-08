# Bug Report — Laravel E-commerce (POS) Codebase

Reviewed: `app/Http/Controllers`, `routes`, `app/Services`, `app/Models`, `error_log`.
(NB: PHP isn't installed in this sandbox, so this is a static/manual review, not a runtime test.)

> ✅ **ShurjoPay removed** — the entire ShurjoPay integration has been fully deleted on this branch:
> - Deleted `app/Http/Controllers/Frontend/ShurjopayControllers.php` and `config/shurjopay.php`.
> - Removed all ShurjoPay code from `CustomerController`, `FrontendController`, `ApiIntegrationController`, `AppServiceProvider`, and `routes/web.php`.
> - Removed the ShurjoPay radio button from the checkout view and the ShurjoPay settings form from the admin payment page.
> - Removed the `shurjopayv2/laravel8` package from `composer.lock` and the `shurjopay` row from the SQL dump.
> The bugs below that reference ShurjoPay (items **#1**, **#2**, **#3**) are therefore **resolved by removal**.

---

## 🔴 Critical — Payment flows

### 1. ShurjoPay success callback is broken (fatal on null)
`app/Http/Controllers/Frontend/ShurjopayControllers.php` → `payment_success()`

- When an order is placed, `CustomerController::order_save()` sends `'order_id' => uniqid()` to ShurjoPay and stores the **real** DB order id in `value1`.
- But the callback does:
  ```php
  $order = Order::where('id', $data[0]->id)->first();
  $order->order_status = 2;   // 💥 $order is null -> "Attempt to assign property on null"
  ```
  `$data[0]->id` is the ShurjoPay (uniqid) id, **not** the orders.id. So the lookup returns `null` and this throws a fatal error. It should be `Order::where('id', $data[0]->value1)`.

- Also inside the failure branch there is dead/unreachable code:
  ```php
  return "failed";
  return redirect()->route('customer.checkout');  // never runs
  ```

### 2. FrontendController::payment_success — duplicate order / double-charge hazard (dead but risky)
`app/Http/Controllers/Frontend/FrontendController.php` → `payment_success()`
- This is a **separate, unused copy** of the ShurjoPay callback that **creates a brand-new Order + Payment** on the success URL (instead of updating the existing one). It also sets `$order->order_status = $data[0]->bank_status` (a ShurjoPay string like `"success"`, not a valid `order_statuses.id`).
- Currently only `ShurjopayControllers::payment_success` is routed, so this is dead code — but if ever wired up it would create a second order (double-charge / duplicate order).

### 3. bKash / online payment orders are stuck pending forever on abandon
`CustomerController::order_save()`
- For `payment_method === 'bkash'`, the order is **created first**, stock is **decremented**, then it redirects to the bKash page. If the user cancels/abandons bKash, the order stays `pending` with stock permanently deducted and there's **no auto-cancel + restock**. The callback only handles paid/failed/cancel after a payment attempt, not abandoned sessions.

---

## 🟠 High — POS (admin) order flow

### 4. POS order edit crashes on products without an image
`app/Http/Controllers/Admin/OrderController.php` → `order_edit()`
```php
'image' => $ordetails->image->image,
```
`OrderDetails::image()` is a `belongsTo(Productimage)` that can be `null` if the product has no image row → `null->image` fatal error.

### 5. POS order update overwrites invoice_id with a random 5-digit number
`OrderController::order_update()`
```php
$order->invoice_id = rand(11111,99999);
```
- Only 5 digits, **no uniqueness check** → collisions are very likely. Everywhere else the order is looked up by `invoice_id` (`invoice()`, `order_edit()`, `process()`, courier calls) so a duplicate breaks those lookups.

### 6. POS `order_process` shipping-fee logic is redundant and confusing
```php
if ($shippingfee->name != $request->area) {   // name vs id — always true, both branches identical
    if ($order->shipping_charge > $shippingfee->amount) { ... }
    else { ... }  // both do exactly the same thing
}
```
Both branches compute the same `$total` — the `if/else` is pointless. Also `$order->amount` is not clamped (could go negative if a big fee is replaced by a small one).

### 7. POS `order_status` bulk-change to "courier" (id 5) double-decrements stock
`OrderController::order_status()`
- When moving to status 5 it decrements `product->stock -= qty`. But stock is **already decremented at order creation** (`order_store()` does `$product->decrement('stock', ...)`). This subtracts the same stock a second time → negative / wrong stock. (Same code also runs in `order_process()` → Steadfast courier branch? No — that one doesn't decrement, but the bulk one does.)

---

## 🟡 Medium — Cart & customer flows

### 8. `GET /add-to-cart/{id}/{qty}` mutates state via GET
`routes/web.php:73` → `ShoppingController::addTocartGet()`
- Cart mutation on a **GET** (pre-fetching/link prefetch can add items to the cart), no auth, **no stock check**, and the `qty` path param is ignored (always 1). Missing product → `$productInfo->id` null error.

### 9. Cart decrement lets quantity become 0
- `ShoppingController::cart_decrement()` and `OrderController::cart_decrement()` use `max(0, $qty - 1)`, leaving a zero-qty line in the cart (frontend cart shows 0-qty item; totals get skewed).

### 10. `password_update` validation is broken/sloppy
`CustomerController::password_update()`
```php
'confirm_password' => 'required_with:new_password|same:new_password|'
```
Trailing `|`, and `new_password` has **no min length** (unlike `DashboardController::newpassword` which uses `min:8`).

### 11. Order lookup by status slug can fatal on bad slug
`OrderController::index()` — when `$slug != 'all'`, `OrderStatus::where('slug',$slug)->first()` can be `null`, then `$order_status->id` throws.

---

## 🔵 Low / robustness

- **`quickview()`** uses `echo` instead of `return response()` — works but bypasses Laravel's response pipeline.
- **`livesearch()`** uses `mb_strlen` — the `error_log` shows repeated `Maximum execution time exceeded in symfony/polyfill-mbstring/Mbstring.php` (the polyfill is very slow on PHP 7.x). A real cause of timeouts on search pages.
- **`payment_status`** values aren't normalized across gateways (ShurjoPay uses raw `bank_status` string; bKash uses `'paid'/'failed'/'pending'`) — reports that filter on `payment_status` will miss ShurjoPay rows.

---

## 🟣 Deployment/environment issues (from `error_log`)

- `Composer dependencies require a PHP version ">= 8.1.0". You are running 7.4.33` — server PHP was too old (project requires `^8.0.2`, some deps need 8.1).
- `Cannot declare class App\Http\Controllers\DashboardController, because the name is already in use` — a duplicate/conflicting class existed at deploy time.
- `Cannot use Str as Str because the name is already in use` (CampaignController) — a duplicate `use` existed at deploy time.
  - ⚠️ Note: the **current** code for `DashboardController` and `CampaignController` looks clean (no duplicate class/`use`), so those two log entries were probably from an older deployment. Worth confirming the deploy artifact isn't stale.
- `Maximum execution time of 30 seconds exceeded` — slow polyfill/long queries on low-resource shared hosting.

---

## Quick priority list
1. **Fix ShurjoPay callback** lookup (`value1`, not `id`) + remove dead `return "failed";`.
2. **Remove/un-wire duplicate** `FrontendController::payment_success` (double-order risk).
3. **Stop double-decrementing stock** in bulk `order_status` (and add restock on cancel).
4. **Fix `order_edit` null image** and **`order_update` invoice collision**.
5. **Guard `addTocartGet`** (stock check + not GET) and **clamp cart qty ≥ 1**.
