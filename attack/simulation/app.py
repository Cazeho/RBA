from flask import Flask, request, render_template_string
import os

app = Flask(__name__)

# Set the upload folder path
UPLOAD_FOLDER = 'uploads'
app.config['UPLOAD_FOLDER'] = UPLOAD_FOLDER

# Ensure the upload folder exists and has correct permissions
if not os.path.exists(UPLOAD_FOLDER):
    os.makedirs(UPLOAD_FOLDER, exist_ok=True)
    print(f"Created upload folder: {UPLOAD_FOLDER}")

@app.route('/')
def index():
    # HTML template as a string
    html_template = '''
    <!doctype html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Upload File</title>
    </head>
    <body>
        <h1>Upload File</h1>
        <form method="post" action="/upload" enctype="multipart/form-data">
            <input type="file" name="file">
            <input type="submit" value="Upload">
        </form>
    </body>
    </html>
    '''
    return render_template_string(html_template)

@app.route('/upload', methods=['POST'])
def upload_file():
    if 'file' not in request.files:
        print("No file part in the request")
        return "No file part in the request"

    file = request.files['file']

    if file.filename == '':
        print("No selected file")
        return "No selected file"

    if file:
        filepath = os.path.join(app.config['UPLOAD_FOLDER'], file.filename)
        try:
            file.save(filepath)
            print(f"File successfully uploaded to {filepath}")
            return f"File successfully uploaded to {filepath}"
        except Exception as e:
            print(f"Failed to save file: {e}")
            return f"Failed to save file: {e}"

if __name__ == "__main__":
    app.run(host='0.0.0.0', port=8080, debug=True)
