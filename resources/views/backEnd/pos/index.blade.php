@extends('admin.layouts.app')

@section('content')
<div class="container flex">
    <!-- Left side: Order form -->
    <div class="w-1/2 p-4 border-r">
        <h2 class="text-xl font-bold mb-4">Create Order</h2>
        <form id="pos-order-form">
            <input type="text" name="user_name" placeholder="User Name" class="border p-2 w-full mb-2">
            <input type="email" name="user_email" placeholder="User Email" class="border p-2 w-full mb-2">
            <div id="selected-products" class="mb-2"></div>
            <button type="submit" class="bg-blue-500 text-white px-4 py-2">Create Order</button>
        </form>
    </div>

    <!-- Right side: Product search -->
    <div class="w-1/2 p-4">
        <h2 class="text-xl font-bold mb-4">Search Products</h2>
        <input type="text" id="product-search" placeholder="Search product..." class="border p-2 w-full mb-2">
        <ul id="product-results" class="border p-2 h-64 overflow-y-scroll"></ul>
    </div>
</div>

<script>
    // Product search
    document.getElementById('product-search').addEventListener('input', async function() {
        let q = this.value;
        let res = await fetch(`/admin/pos/product-search?q=${q}`);
        let products = await res.json();

        let html = products.map(p => `<li data-id="${p.id}" data-name="${p.name}" data-price="${p.price}" class="cursor-pointer p-1 border-b">${p.name} - $${p.price}</li>`).join('');
        document.getElementById('product-results').innerHTML = html;

        // Click to add product
        document.querySelectorAll('#product-results li').forEach(li => {
            li.onclick = () => {
                let id = li.dataset.id;
                let name = li.dataset.name;
                let price = li.dataset.price;
                let selected = document.getElementById('selected-products');
                selected.innerHTML += `<div>${name} - $${price} <input type="hidden" name="products[${id}][id]" value="${id}"><input type="number" name="products[${id}][quantity]" value="1"><input type="hidden" name="products[${id}][price]" value="${price}"></div>`;
            }
        });
    });

    // Submit order
    document.getElementById('pos-order-form').addEventListener('submit', async function(e) {
        e.preventDefault();
        let formData = new FormData(this);
        let res = await fetch(`/admin/pos/order-create`, {
            method: 'POST',
            headers: { 'X-CSRF-TOKEN': '{{ csrf_token() }}' },
            body: formData
        });
        let data = await res.json();
        if(data.success) alert('Order Created! ID: ' + data.order_id);
    });
</script>
@endsection
