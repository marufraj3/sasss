<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\CustomerTag;
use Illuminate\Http\Request;

class CustomerTagController extends Controller
{
    public function index()
    {
        return view('backEnd.customer.tags', ['tags' => CustomerTag::withCount('customers')->orderBy('name')->get()]);
    }

    public function store(Request $request)
    {
        $data = $request->validate(['name' => ['required', 'string', 'max:60', 'unique:customer_tags,name'], 'color' => ['nullable', 'string', 'max:20']]);
        CustomerTag::create(['name' => $data['name'], 'color' => $data['color'] ?? '#087f5b']);
        return back()->with('success', 'Customer tag created.');
    }

    public function destroy(CustomerTag $customerTag)
    {
        $customerTag->customers()->detach();
        $customerTag->delete();
        return back()->with('success', 'Customer tag deleted.');
    }
}
