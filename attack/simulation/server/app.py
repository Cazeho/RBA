from flask import Flask, request, render_template_string, jsonify
import os
import argparse
import logging

app = Flask(__name__)

# Configuration
UPLOAD_FOLDER = 'uploads'
MAX_CONTENT_LENGTH = 100 * 1024 * 1024  # 100 MB limit per file, adjust as needed
app.config['UPLOAD_FOLDER'] = UPLOAD_FOLDER
app.config['MAX_CONTENT_LENGTH'] = MAX_CONTENT_LENGTH

# Ensure the upload folder exists and has correct permissions
if not os.path.exists(UPLOAD_FOLDER):
    os.makedirs(UPLOAD_FOLDER, exist_ok=True)
    print(f"Created upload folder: {UPLOAD_FOLDER}")

# Setup logging
logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)

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

@app.route('/upload', methods=['POST', 'PUT'])
def upload_file():
    if 'file' not in request.files:
        logger.error("No file part in the request")
        return jsonify({"error": "No file part in the request"}), 400

    file = request.files['file']

    if file.filename == '':
        logger.error("No selected file")
        return jsonify({"error": "No selected file"}), 400

    if file:
        filepath = os.path.join(app.config['UPLOAD_FOLDER'], file.filename)
        try:
            file.save(filepath)
            logger.info(f"File successfully uploaded to {filepath}")
            return jsonify({"message": f"File successfully uploaded to {filepath}"}), 200
        except Exception as e:
            logger.error(f"Failed to save file: {e}")
            return jsonify({"error": f"Failed to save file: {e}"}), 500

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description='Run Flask file upload server.')
    parser.add_argument('--port', type=int, default=8080, help='Port to run the Flask server on.')
    args = parser.parse_args()
    app.run(host='0.0.0.0', port=args.port)
