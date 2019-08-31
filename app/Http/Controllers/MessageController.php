<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Message;

class MessageController extends Controller
{
    public function fetch() {
        return Message::all();
    }
    public function create(Request $request) {
        Message::create([
            'text' => $request->text
        ]);
        return $request;
    }
}
