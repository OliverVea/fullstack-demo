from flask import Flask, Response, redirect
import random

app = Flask(
    __name__,
    static_folder='wwwroot',
    static_url_path='')

@app.route('/')
def index():
    return redirect('/index.html')

@app.route('/api/get-number')
def numbers():
    number = random.random() * 100
    return Response(str(number), mimetype='text/plain')

if __name__ == "__main__":
    app.run(debug=True)


# cors
@app.after_request
def after_request(response):
    response.headers.add('Access-Control-Allow-Origin', '*')
    response.headers.add('Access-Control-Allow-Headers', 'Content-Type,Authorization')
    response.headers.add('Access-Control-Allow-Methods', 'GET,PUT,POST,DELETE')
    return response
