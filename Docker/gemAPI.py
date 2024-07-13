from flask import Flask, request, jsonify
import PIL.Image
import google.generativeai as genai
from IPython.display import Markdown
import textwrap
from flask_cors import CORS

app = Flask(__name__)
CORS(app)

genai.configure(api_key="AIzaSyAUY5Wfh_40UsWEW0Be9WzYVQwFLRG3ZcU")

history = [
    {
        'role': "user",
        'parts': [ "your website is called INTELL$MART, an e-commerce platform that offers a wide range of products and services." ],
      },
      {
        'role': "model",
        'parts': ["ok, I will do that" ],
      },
      {
        'role': "user",
        'parts': [ "do not answer any question not related to e-commerce or related fields." ],
      },
      {
        'role': "model",
        'parts': [ "ok, I will do that" ],
      },
      {
        'role': "user",
        'parts': [ "do not answer in the Markdown format." ],
      },
      {
        'role': "model",
        'parts': [ "ok, I will do that" ],
      },
]


@app.route('/image/', methods=['POST'])
def generate_content():
    # Get prompt and image from the request
    prompt = request.form['prompt']
    image_file = request.files['image']
    img = PIL.Image.open(image_file)

    # Initialize Generative Model
    model = genai.GenerativeModel('gemini-pro-vision')
    # chat = model.start_chat(history=history)

    # Generate content
    # response = chat.send_message([prompt, img])
    response = model.generate_content([prompt, img], stream=True)
    response.resolve()

    # Convert response to Markdown
    text = response.text
    text = text.replace('•', ' *')
    # markdown_text = Markdown(textwrap.indent(text, '> ', predicate=lambda _: True))
    print(text)
    return {'generated_content': text}

@app.route('/text/', methods=['POST'])
def generate_content_image():
    # # Get prompt and image from the request
    # prompt = request.form['prompt']
    
    data = request.get_json()
    prompt = data.get('prompt')
    
    # Initialize Generative Model
    model = genai.GenerativeModel('gemini-pro')
    chat = model.start_chat(history=history)

    # Generate content
    response = chat.send_message(prompt)
    # response = model.generate_content(prompt, stream=True)
    response.resolve()

    # Convert response to Markdown
    text = response.text
    text = text.replace('•', ' *')
    # markdown_text = Markdown(textwrap.indent(text, '> ', predicate=lambda _: True))
    print(text)
    return {'generated_content': text}

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0', port='7767')
