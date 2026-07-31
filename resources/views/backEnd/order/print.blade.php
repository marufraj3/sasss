<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Order Print</title>
    <link rel="stylesheet" href="{{asset('public/frontEnd/css/bootstrap.min.css')}}" />
    <link rel="stylesheet" href="{{asset('public/frontEnd/css/all.min.css')}}" />
</head>
<body>

<div class="container">
    <div class="row">
        <div class="col-sm-12 mt-3 text-center">
            <button onclick="printFunction()"class="no-print btn btn-xs btn-success waves-effect waves-light"><i class="fa fa-print"></i></button>
        </div>
    </div>
</div>
@foreach($orders as $order)
<section class="customer-invoice alz-clone">
 @php
    // Safe helpers
    $shopLogo = asset($generalsetting->white_logo ?? '');
    $shopName = $generalsetting->name ?? '';
    $shopPhone = $contact->phone ?? '';
    $shopEmail = $contact->email ?? '';
    $shopAddress = $contact->address ?? '';
    $paymentMethod = optional($order->payment)->payment_method ?? '';

    $shipName = optional($order->shipping)->name ?? '';
    $shipPhone = optional($order->shipping)->phone ?? '';
    $shipAddress = trim(optional($order->shipping)->address ?? '', ' ,');
    $invoiceId = $order->invoice_id ?? $order->id;
    $invoiceDate = $order->created_at?->format('Y-m-d') ?? \Carbon\Carbon::now()->format('Y-m-d');

    // Totals
    $subTotal = $order->orderdetails->sum(function($d){ return ($d->sale_price ?? 0) * ($d->qty ?? 0); });
    $qtyTotal = $order->orderdetails->sum('qty') ?? 0;
    $shippingCharge = $order->shipping_charge ?? 0;
    $discount = $order->discount ?? 0;
    $total = $subTotal + $shippingCharge - $discount;
    $finalAmount = $order->amount ?? $total;

    // Paid/Due
    $paid = $order->paid_amount ?? 0;
    $due = max($finalAmount - $paid, 0);

    // Extra meta
    $deliveryPartner = optional($order->courier)->name ?? ($order->delivery_partner ?? '');
    $pageName = $order->source ?? ($order->page_name ?? '');
    $ref = $order->reference ?? '';
    $status = ucfirst($order->status ?? '');
    $note = $order->note ?? '';

    $barcodeValue = ltrim((string)$invoiceId, '#');
    $printNow = \Carbon\Carbon::now()->format('d/m/Y, h:i:s A');
@endphp


  <style>
    /* Scoped styles for cloned design */
    .alz-clone{--brand:#EC8E00; --border:#ddd; --text:#222; --muted:#666}
    .alz-clone *{box-sizing:border-box}
    .alz-clone .container{max-width:1000px;margin:0 auto;padding:0 12px}
    .alz-toolbar{position:sticky;top:0;background:#fff;border:1px solid var(--border);border-radius:8px;padding:10px;margin:12px 0;display:flex;gap:8px}
    .alz-toolbar .btn{padding:8px 12px;border:1px solid var(--border);background:#fff;border-radius:6px;cursor:pointer}
    .alzi-wrap .alz-invoice, .alzi-wrap .alz-manifest{background:#fff;border:1px solid var(--border);border-radius:6px;margin:12px 0;overflow:hidden}
    .alz-section{padding:12px}
    .alz-header{display:grid;grid-template-columns:1fr 220px 1fr;gap:12px;align-items:flex-start}
    .alz-logo{height:42px;object-fit:contain}
    .alz-shop p{margin:.2rem 0;white-space:pre-line;color:#333}
    .alz-barcode{text-align:center}
    .alz-barcode svg{width:100%;height:120px}
    .alz-box{border:1px solid #000;padding:8px}
    .alz-box h3{margin:.2rem 0;color:var(--brand)}
    .alz-box p{margin:.25rem 0;font-weight:700;font-size:14px;line-height:1.35}
    .alz-table{width:100%;border-collapse:collapse}
    .alz-table th,.alz-table td{border-top:1px solid var(--border);padding:8px;text-align:left;font-size:14px}
    .alz-table thead th{background:#fafafa;border-top:none}
    .alz-thumb{height:40px;width:40px;object-fit:cover}
    .alz-bottom{display:grid;grid-template-columns:1fr 360px;gap:12px;margin-top:6px}
    .alz-summary{width:100%;border-collapse:collapse;border:1px solid var(--border)}
    .alz-summary th,.alz-summary td{padding:8px;border-bottom:1px solid var(--border);font-size:14px;text-align:left}
    .alz-summary tr:last-child td,.alz-summary tr:last-child th{border-bottom:none}
    .alz-summary .due{background:var(--brand);color:#000;font-weight:700}
    .alz-summary .qty b{color:red}
    .alz-meta p{margin:.25rem 0}
    .alz-thanks{margin-top:10px;border:1px solid var(--text);padding:8px;font-size: 10px;
    text-align: center;}
    .alz-note{padding:12px;text-decoration:underline;font-weight:700}
    .alz-mini{width:100%;border-collapse:collapse}
    .alz-mini th,.alz-mini td{padding:8px;border:1px solid var(--border);font-size:14px;text-align:left}
    .alz-grid2{display:grid;grid-template-columns:1fr 1fr;gap:12px}
    .no-print{ /* will be hidden on print */ }
    @media print{
      .no-print{display:none !important}
      .alz-toolbar{display:none !important}
      @page{size:A4;}
      .alzi-wrap .alz-invoice, .alzi-wrap .alz-manifest{break-inside:avoid}
    }
  </style>

  <div class="container">
    <div class="alz-toolbar no-print">
      
      <button class="btn" onclick="window.print()"><i class="fa fa-print"></i> Print Invoice</button>
    </div>

    <div class="alzi-wrap">
      {{-- দুই কপি ইনভয়েস --}}
      @for($copy=1;$copy<=1;$copy++)
      <div class="alz-invoice">
        <div class="alz-section alz-header">
          <div>
            <img class="alz-logo" src="{{ $shopLogo }}" alt="Logo">
            <div class="alz-shop">
              <p>{{ $shopAddress }}</p>
              <p>Phone: {{ $shopPhone }}<br>Email: {{ $shopEmail }}</p>
            </div>
          </div>
          <div class="alz-barcode" data-value="{{ $barcodeValue }}">
            <svg></svg> s
          </div>
          <div class="alz-box">
            <h3>INVOICE</h3>
            <p>
              Order ID: {{ $invoiceId }}<br>
              Order Date: {{ $invoiceDate }}<br>
              Buyer Name: {{ $shipName }}<br>
              Address: {{ $shipAddress }}<br>
              Phone: {{ $shipPhone }}
            </p>
          </div>
        </div>

        <div class="alz-section">
          <table class="alz-table">
            <thead>
              <tr>
                <th>#</th>
                <th>Item</th>
                <th>Code</th>
                <th>Size</th>
                <th>Unit Cost</th>
                <th>Qty</th>
                <th>Total</th>
              </tr>
            </thead>
            <tbody>
              @foreach($order->orderdetails as $key=>$value)
                @php
                  $img = asset(optional($value->image)->image ?? '');
                  $lineTotal = ($value->sale_price ?? 0) * ($value->qty ?? 0);
                  $code = $value->product_code ?? $value->sku ?? '';
                  $size = $value->product_size ?? '';
                @endphp
                <tr>
                  <td><img class="alz-thumb" src="{{ $img }}" alt="{{ $value->product_name }}"></td>
                  <td>{{ $value->product_name }}</td>
                  <td>{{ $code }}</td>
                  <td>{{ $size }}</td>
                  <td>{{ number_format($value->sale_price ?? 0, 0) }}</td>
                  <td>{{ $value->qty }}</td>
                  <td>{{ number_format($lineTotal, 0) }}</td>
                </tr>
              @endforeach
            </tbody>
          </table>

          <div class="alz-bottom">
            <div class="alz-meta">
              <p>Delivery Partner: <b>Pathao</b></p>
              <p>Page Name: <b>Arza Mart</b></p>
              <p>Print <span class="print-time">{{ $printNow }}</span></p>
            </div>
            <div>
              <table class="alz-summary">
                <tr><th>TOTAL Qty:</th><td class="qty"><b>{{ $qtyTotal }}</b></td></tr>
                <tr><th>SUB TOTAL:</th><td>{{ number_format($subTotal, 0) }}</td></tr>
                <tr><th>SHIPPING:</th><td>{{ number_format($shippingCharge, 0) }}</td></tr>
                <tr><th>Discount:</th><td>{{ number_format($discount, 0) }}</td></tr>
                <tr><th>TOTAL:</th><td>{{ number_format($finalAmount, 0) }}</td></tr>
                <tr><th>PAID:</th><td>{{ number_format($paid, 0) }}</td></tr>
                <tr class="due"><th>DUE:</th><td>{{ number_format($due, 0) }}</td></tr>
              </table>
            </div>
          </div>
           <div class="alz-thanks">
              প্রোডাক্ট ভালো লাগলে অবশ্যই আমাদের ফেসবুক পেজে লাইক এবং রিভিউ দিবেন — আপনাদের রিভিউ আমাদের কাজ করতে আরো উৎসাহিত করে।
            </div>
        </div>
      </div>
      @endfor

      {{-- ম্যানিফেস্ট/নোট ব্লক --}}
     
    </div> <!-- /.alzi-wrap -->
  </div> 

  {{-- JsBarcode --}}
  <script src="https://cdn.jsdelivr.net/npm/jsbarcode@3.11.5/dist/JsBarcode.all.min.js"></script>
  <script>
    (function(){
      function uniqId(){ return 'bc'+Math.random().toString(36).slice(2,9); }
      function renderBarcode(container){
        if(!container) return;
        const val = String(container.dataset.value||'');
        const svg = container.querySelector('svg') || container.appendChild(document.createElement('svg'));
        const id = uniqId();
        svg.setAttribute('id', id);
        JsBarcode('#'+id, val, {format:'CODE128', lineColor:'#000', width:2, height:80, displayValue:true, fontSize:16, margin:0});
      }
      function renderAll(){
        document.querySelectorAll('.alz-barcode').forEach(el=>{
          if(!el.dataset.rendered){ renderBarcode(el); el.dataset.rendered = '1'; }
        });
        document.querySelectorAll('.print-time').forEach(el=>{
          try{ el.textContent = new Date().toLocaleString('en-GB'); }catch(e){}
        });
      }
      window.cloneInvoice = function(){
        const wrap = document.querySelector('.alzi-wrap');
        const first = wrap.querySelector('.alz-invoice');
        if(!first) return;
        const clone = first.cloneNode(true);
        // reset barcode for re-render
        const bc = clone.querySelector('.alz-barcode');
        if(bc){ bc.dataset.rendered=''; const olds=bc.querySelector('svg'); if(olds) olds.remove(); bc.appendChild(document.createElement('svg')); }
        wrap.insertBefore(clone, wrap.querySelector('.alz-manifest'));
        renderAll();
      }
      document.addEventListener('DOMContentLoaded', renderAll);
    })();
  </script>
</section>
@endforeach
<script>
    function printFunction() {
        window.print();
    }
</script>
</body>
</html>
