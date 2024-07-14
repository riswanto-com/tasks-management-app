<?php

use App\Http\Controllers\DashboardController;
use App\Http\Controllers\ProfileController;
use App\Http\Controllers\TaskController;
use Illuminate\Foundation\Application;
use Illuminate\Support\Facades\Route;


Route::get('/dashboard',[DashboardController::class,'index'])->middleware(['auth', 'verified'])->name('dashboard');
Route::get('/', [DashboardController::class,'index'])->middleware(['auth', 'verified'])->name('dashboard');

Route::middleware('auth')->group(function () {
    Route::delete('/tasks/{id}',[TaskController::class,'destroy'])->name('tasks.destroy');
    Route::put('/tasks/{id}',[TaskController::class,'update'])->name('tasks.update');
    Route::post('/tasks',[TaskController::class,'store'])->name('tasks.store');
    Route::get('/tasks',[TaskController::class,'index'])->name('tasks.index');
    Route::get('/tasks/create',[TaskController::class,'create'])->name('tasks.create');
    Route::get('/tasks/{id}',[TaskController::class,'show'])->name('tasks.show');
    Route::get('/tasks/{id}/edit ',[TaskController::class,'edit'])->name('tasks.edit');
    Route::get('/profile', [ProfileController::class, 'edit'])->name('profile.edit');
    Route::patch('/profile', [ProfileController::class, 'update'])->name('profile.update');
    Route::delete('/profile', [ProfileController::class, 'destroy'])->name('profile.destroy');
});

require __DIR__.'/auth.php';
