@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card chatbot-card">
                <div class="card-header chatbot-header">Chatbot</div>
                <div class="card-body">
                    <div id="chat-messages" class="chat-messages">
                        <!-- Chat messages will be appended here -->
                    </div>
                    <form id="chat-form" class="chat-form" action="{{ route('chatbot.generate') }}" method="POST" enctype="multipart/form-data">
                        @csrf
                        <div class="input-group">
                            <input type="text" name="prompt" id="message" class="form-control" placeholder="Type your message..." required>
                            <div class="input-group-append">
                                <button type="submit" class="btn btn-primary">Send</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
document.getElementById('chat-form').addEventListener('submit', async function(event) {
    event.preventDefault();
    
    const messageInput = document.getElementById('message');
    const chatMessages = document.getElementById('chat-messages');
    
    // Append user message to chat
    const userMessageDiv = document.createElement('div');
    userMessageDiv.classList.add('alert', 'alert-primary', 'chat-bubble', 'user-message');
    userMessageDiv.innerHTML = '<i class="fas fa-user message-icon"></i>' + messageInput.value;
    chatMessages.appendChild(userMessageDiv);
    
    // Scroll to the bottom of the chat
    chatMessages.scrollTop = chatMessages.scrollHeight;

    // Send message to server
    const response = await fetch('{{ route('chatbot.generate') }}', {
        method: 'POST',
        headers: {
            'X-CSRF-TOKEN': '{{ csrf_token() }}',
            'Content-Type': 'application/json',
        },
        body: JSON.stringify({ prompt: messageInput.value })
    });
    
    const result = await response.json();
    
    // Append chatbot response to chat
    const botMessageDiv = document.createElement('div');
    botMessageDiv.classList.add('alert', 'alert-success', 'chat-bubble', 'bot-message');
    botMessageDiv.innerHTML = '<i class="fas fa-robot message-icon"></i>' + result.generated_content;
    chatMessages.appendChild(botMessageDiv);
    
    // Scroll to the bottom of the chat
    chatMessages.scrollTop = chatMessages.scrollHeight;
    
    // Clear the input
    messageInput.value = '';
});
</script>
@endsection
