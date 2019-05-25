<?php

use Illuminate\Routing\Router;

Admin::registerAuthRoutes();

Route::group([
    'prefix'        => config('admin.route.prefix'),
    'namespace'     => config('admin.route.namespace'),
    'middleware'    => config('admin.route.middleware'),
], function (Router $router) {
    $router->get('/', 'HomeController@index');
//    $router->get('/', 'UsersController@index');
    $router->resource('users', 'UsersController');
    $router->resource('categories', 'CategoriesController');
    $router->resource('tukus', 'TukusController');
    $router->resource('logs', 'LogsController');
    $router->get('products', 'ProductsController@index');
    $router->get('tukus/del/{tukuid}', 'TukusController@del');
//    $router->get('api/categories', 'CategoriesController@apiIndex');

    $router->post('tukus/release', 'TukusController@release');
});

