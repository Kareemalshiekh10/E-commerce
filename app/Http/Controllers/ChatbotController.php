<?php
namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Http;

class ChatbotController extends Controller
{
    public function index()
    {
        return view('chatbot');
    }

    public function generateImageContent(Request $request)
    {
        $formData = [
            'prompt' => $request->input('prompt'),
            'image' => $request->file('image'),
        ];

        // Make POST request to Flask API
        $response = Http::attach(
            'image',
            file_get_contents($formData['image']),
            $formData['image']->getClientOriginalName()
        )->post('http://localhost:7767/image/', $formData);

        $generatedContent = $response->json()['generated_content'];

        // Return JSON response with generated content
        return response()->json(['generated_content' => $generatedContent]);
    }

    public function generateTextContent(Request $request)
    {
        $formData = [
            'prompt' => $request->input('prompt'),
        ];

        // Make POST request to Flask API
        $response = Http::post('http://localhost:5000/text/', $formData);

        $generatedContent = $response->json()['generated_content'];

        // Return JSON response with generated content
        return response()->json(['generated_content' => $generatedContent]);
    }
}
