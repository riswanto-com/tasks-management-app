<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Tasks;
use App\Models\User;
use Illuminate\Support\Facades\DB;
use Inertia\Inertia;

class DashboardController extends Controller
{
    //
    public function index()
    {
        $user = auth()->user();
        $pending = Tasks::where('user_id', $user->id)
            ->where('status', 'pending')->count();
        $inProgress = Tasks::where('user_id', $user->id)
            ->where('status', 'in-progress')->count();
        $completed = Tasks::where('user_id', $user->id)
            ->where('status', 'completed')->count();
        $data=[
            'pending' => $pending,
            'inProgress' => $inProgress,
            'completed' => $completed,
            'completedProgress'     =>ceil(($completed/($pending+$inProgress+$completed))*100)

        ];
        // print_r($data);
        // die();
        return Inertia::render('Dashboard',$data );
    }
}
