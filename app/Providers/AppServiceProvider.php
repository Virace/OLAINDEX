<?php

namespace App\Providers;

use Illuminate\Routing\UrlGenerator;
use Illuminate\Support\ServiceProvider;
use Schema;

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
    public function boot(UrlGenerator $url)
    {
        $sqlFile = install_path('data/database.sqlite');

        if (file_exists($sqlFile) || env('DB_CONNECTION') === 'mysql') {
            Schema::defaultStringLength(191);
        }

        if(env('REDIRECT_HTTPS'))
        {
            $url->forceScheme('https');
        }
    }
}
