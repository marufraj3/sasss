<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Campaign;
use App\Models\CampaignReview;
use App\Models\Product;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\File;
use Illuminate\Support\Str;
use Image;
use Toastr;

class CampaignController extends Controller
{
    public function index()
    {
        $show_data = Campaign::withCount('products')->latest('id')->get();

        return view('backEnd.campaign.index', compact('show_data'));
    }

    public function create()
    {
        $products = Product::where('status', 1)->orderBy('name')->get(['id', 'name', 'new_price', 'stock']);

        return view('backEnd.campaign.create', compact('products'));
    }

    /** The legacy show route now leads to the editable landing-page builder. */
    public function show($id)
    {
        return redirect()->route('campaign.edit', $id);
    }

    public function store(Request $request)
    {
        $validated = $this->validatedData($request, true);
        $input = $this->campaignInput($request, $validated);
        $campaign = Campaign::create($input);
        $this->syncProducts($campaign, $validated['product_ids']);
        $this->storeReviewImages($request, $campaign);

        Toastr::success('Landing page created successfully.', 'Success');
        return redirect()->route('campaign.edit', $campaign->id);
    }

    public function edit($id)
    {
        $edit_data = Campaign::with(['images', 'products'])->findOrFail($id);
        $products = Product::where('status', 1)->orderBy('name')->get(['id', 'name', 'new_price', 'stock']);
        $selectedProductIds = $edit_data->products->pluck('id')->all();

        // Backward compatibility for pages created before multi-product campaigns.
        if (empty($selectedProductIds) && $edit_data->product_id) {
            $selectedProductIds = [(int) $edit_data->product_id];
        }

        return view('backEnd.campaign.edit', compact('edit_data', 'products', 'selectedProductIds'));
    }

    public function update(Request $request)
    {
        $campaign = Campaign::findOrFail($request->hidden_id);
        $validated = $this->validatedData($request);
        $input = $this->campaignInput($request, $validated, $campaign);
        $campaign->update($input);
        $this->syncProducts($campaign, $validated['product_ids']);
        $this->storeReviewImages($request, $campaign);

        Toastr::success('Landing page updated successfully.', 'Success');
        return redirect()->route('campaign.edit', $campaign->id);
    }

    public function inactive(Request $request)
    {
        Campaign::findOrFail($request->hidden_id)->update(['status' => 0]);
        Toastr::success('Landing page is now inactive.', 'Success');
        return back();
    }

    public function active(Request $request)
    {
        Campaign::findOrFail($request->hidden_id)->update(['status' => 1]);
        Toastr::success('Landing page is now active.', 'Success');
        return back();
    }

    public function destroy(Request $request)
    {
        $campaign = Campaign::findOrFail($request->hidden_id);
        $campaign->products()->detach();
        $campaign->delete();

        Toastr::success('Landing page deleted successfully.', 'Success');
        return back();
    }

    public function imgdestroy(Request $request)
    {
        $image = CampaignReview::findOrFail($request->id);
        File::delete($image->image);
        $image->delete();

        Toastr::success('Image deleted successfully.', 'Success');
        return back();
    }

    private function validatedData(Request $request, bool $creating = false): array
    {
        return $request->validate([
            'name' => ['required', 'string', 'max:255'],
            'banner_title' => ['nullable', 'string', 'max:255'],
            'video' => ['nullable', 'url', 'max:255'],
            'short_description' => ['required', 'string'],
            'description' => ['required', 'string'],
            'review' => ['nullable', 'string', 'max:1000'],
            'status' => ['nullable', 'boolean'],
            'product_ids' => ['required', 'array', 'min:1', 'max:30'],
            'product_ids.*' => ['integer', 'distinct', 'exists:products,id'],
            'banner' => [$creating ? 'required' : 'nullable', 'image', 'mimes:jpg,jpeg,png,webp', 'max:4096'],
            'image_one' => [$creating ? 'required' : 'nullable', 'image', 'mimes:jpg,jpeg,png,webp', 'max:4096'],
            'image_two' => ['nullable', 'image', 'mimes:jpg,jpeg,png,webp', 'max:4096'],
            'image_three' => ['nullable', 'image', 'mimes:jpg,jpeg,png,webp', 'max:4096'],
            'image.*' => ['nullable', 'image', 'mimes:jpg,jpeg,png,webp', 'max:4096'],
        ]);
    }

    private function campaignInput(Request $request, array $validated, ?Campaign $campaign = null): array
    {
        $input = collect($validated)->except(['product_ids', 'banner', 'image_one', 'image_two', 'image_three', 'image'])->all();
        $input['slug'] = $this->uniqueSlug($validated['name'], $campaign);
        $input['status'] = $request->boolean('status') ? 1 : 0;
        $input['product_id'] = $validated['product_ids'][0]; // legacy pages and integrations

        foreach (['banner', 'image_one', 'image_two', 'image_three'] as $field) {
            if ($request->hasFile($field)) {
                if ($campaign && $campaign->{$field}) {
                    File::delete($campaign->{$field});
                }
                $input[$field] = $this->storeWebp($request->file($field));
            }
        }

        return $input;
    }

    private function syncProducts(Campaign $campaign, array $productIds): void
    {
        $syncData = [];
        foreach (array_values($productIds) as $sortOrder => $productId) {
            $syncData[$productId] = ['sort_order' => $sortOrder];
        }
        $campaign->products()->sync($syncData);
    }

    private function storeReviewImages(Request $request, Campaign $campaign): void
    {
        foreach ($request->file('image', []) as $image) {
            if ($image) {
                $campaign->images()->create(['image' => $this->storeWebp($image)]);
            }
        }
    }

    private function storeWebp($file): string
    {
        $directory = public_path('uploads/campaign');
        File::ensureDirectoryExists($directory);
        $filename = now()->format('YmdHis') . '-' . Str::random(10) . '.webp';
        Image::make($file->getRealPath())->orientate()->encode('webp', 85)->save($directory . '/' . $filename);

        return 'public/uploads/campaign/' . $filename;
    }

    private function uniqueSlug(string $name, ?Campaign $campaign = null): string
    {
        $base = Str::slug($name) ?: 'landing-page';
        $slug = $base;
        $counter = 2;
        while (Campaign::where('slug', $slug)->when($campaign, fn ($query) => $query->where('id', '!=', $campaign->id))->exists()) {
            $slug = $base . '-' . $counter++;
        }
        return $slug;
    }
}
