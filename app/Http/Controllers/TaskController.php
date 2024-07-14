<?php

namespace App\Http\Controllers;

use App\Models\Tasks;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Inertia\Inertia;

class TaskController extends Controller
{
    public function index(Request $request)
    {
        // $tasks = Tasks::all();
        $user = auth()->user();
        $tasks =  DB::table('users')
        ->join('tasks', 'users.id', '=', 'tasks.user_id')
        ->select('users.id as userId','users.name as name','tasks.*')
        ->where('tasks.user_id', $user->id);
        $title='';
        $date='';
        $status='';
        if ($request->filled('title')) {
            $title=$request->input('title');
            $tasks->where('tasks.title', 'like', '%' . $title . '%');
        }
        if ($request->filled('date')) {
            $date=$request->input('date');
            $tasks->whereDate('tasks.due_date', $date);
        }
        if ($request->filled('status')) {
            $status=$request->input('status');
            $tasks->where('tasks.status', $status);
        }

        return Inertia::render('Tasks/Index', ['tasks' => $tasks->paginate(10),
            'title'=>$title,
            'date'=>$date,
            'url'=>"&due_date=".$date."&status=".$status."&title=".$title,
            '_status'=>$status
    ]);
    }

    public function create()
    {
        $user = User::all();

        return Inertia::render('Tasks/Create', ['user' => $user]);
    }

    public function store(Request $request)
    {
        $request->validate([
            'title' => 'required|string',
            'description' => 'required|string',
            'status' => 'required|in:pending,in-progress,completed',
            'dueDate' => 'required|nullable|date',
            'userId'=>'required'
        ]);

        $task = Tasks::create([
            'title' => $request->title,
            'description' => $request->description,
            'status' => $request->status,
            'user_id' => $request->userId,
            'create_id' => 1,
            'due_date' => $request->dueDate
        ]);
        if ($task) {
            return redirect()->to('/tasks')->with('message', 'Task Create Successfully');
        } else {
            return response()->json($task, 201);
        }
    }

    public function show(Tasks $id)
    {
        $user = auth()->user();
        $task =  DB::table('tasks')
        ->join('users', 'users.id', '=', 'tasks.user_id')
        ->select('users.id as userId','users.name as name','tasks.*')
        ->where('tasks.user_id', $user->id)
        ->where('tasks.id',$id->id)
        ->get()
        ;
        return Inertia::render('Tasks/Show', ['tasks' => $task]);
    }

    public function edit(Tasks $id)
    {

        $user = User::all();
        return Inertia::render('Tasks/Edit', ['tasks' => $id, 'user' => $user]);
    }

    public function update(Request $request, Tasks $id)
    {
        $request->validate([
            'title' => 'required|string',
            'description' => 'required|string',
            'status' => 'required|in:pending,in-progress,completed',
            'dueDate' => 'nullable|date'
        ]);
        $data = [
            'title' => $request->title,
            'description' => $request->description,
            'status' => $request->status,
            'user_id' => $request->userId,
            'due_date' => $request->dueDate
        ];
        $id->update($data);

        if ($id) {
            return redirect()->to('/tasks')->with('message', 'Task Update Successfully');
        } else {
            return redirect()->to('/tasks')->with('message', 'Task Update Failed');
        }
    }

    public function destroy(Tasks $id)
    {
        $id->delete();
        if ($id) {
            return redirect()->to('/tasks')->with('message', 'Task Delete Successfully');
        } else {
            return redirect()->to('/tasks')->with('message', 'Task Delete Failed');
        }
    }
}
