<?php

namespace App\Providers;

use Illuminate\Support\ServiceProvider;
use App\Models\GeneralSetting;
use App\Models\Category;
use App\Models\Brand;
use App\Models\SocialMedia;
use App\Models\Contact;
use App\Models\CreatePage;
use App\Models\OrderStatus;
use App\Models\EcomPixel;
use App\Models\GoogleTagManager;
use App\Models\Order;
use App\Models\Product;
use App\Models\Banner;
use App\Models\Subcategory;
use App\Models\Childcategory;
use App\Services\StorefrontCache;
use Session;
use Illuminate\Support\Facades\Cache;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     *
     * @return void
     */
    public function register()
    {
        //
    }

    /**
     * Bootstrap any application services.
     *
     * @return void
     */
    public function boot()
    {
        // Keep short-lived storefront caches fresh immediately after merchandising changes.
        foreach ([Product::class, Category::class, Subcategory::class, Childcategory::class, Banner::class, Brand::class, GeneralSetting::class, SocialMedia::class, Contact::class, CreatePage::class] as $model) {
            $model::saved(fn () => StorefrontCache::forget());
            $model::deleted(fn () => StorefrontCache::forget());
        }

        // Shared storefront data previously caused multiple queries on every page load,
        // plus a menu N+1 query. A short cache keeps the shop responsive while allowing
        // content changes to appear quickly.
        $storefront = Cache::remember('storefront.shared.v2', now()->addMinutes(5), function () {
            $menus = Category::where('status', 1)
                ->select('id', 'name', 'slug', 'status', 'image')
                ->with(['subcategories.childcategories'])
                ->get();

            $activePages = CreatePage::where('status', 1)->get();

            return [
                'generalsetting' => GeneralSetting::where('status', 1)->first(),
                'sidecategories' => Category::where('parent_id', 0)->where('status', 1)->select('id', 'name', 'slug', 'status', 'image')->get(),
                'menucategories' => $menus,
                'contact' => Contact::where('status', 1)->first(),
                'socialicons' => SocialMedia::where('status', 1)->get(),
                'pages' => $activePages->take(3),
                'pagesright' => $activePages->slice(3, 10)->values(),
                'cmnmenu' => $activePages,
                'brands' => Brand::where('status', 1)->get(),
                'pixels' => EcomPixel::where('status', 1)->get(),
                'gtm_code' => GoogleTagManager::where('status', 1)->get(),
            ];
        });
        view()->share($storefront);
        
        $neworder = Order::where('order_status','1')->count();
        view()->share('neworder',$neworder); 
        
        $pendingorder = Order::where('order_status','1')->latest()->limit(9)->get();
        view()->share('pendingorder',$pendingorder); 
        
        $orderstatus = OrderStatus::get();
        view()->share('orderstatus',$orderstatus);
        

    }
}
