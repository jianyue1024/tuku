<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Auth::routes(['verify' => true]);

Route::redirect('/', '/tukus')->name('root')->middleware('verified');
Route::get('tukus', 'TukusController@index')->name('tukus.index');
Route::get('tukus/downloadImg', 'TukusController@downloadImg')->name('tukus.downloadImg');
Route::post('tukus', 'TukusController@ajax')->name('tukus.ajax');


