from flask import Flask
from flask_cors import CORS
from movies.movies_api import movies_api

app = Flask(__name__)
CORS(app, resources={r"/*": {"origins": "*"}})  # Or replace * with specific origin
# ✅ For production, you can replace "*" with:
#CORS(app, resources={r"/*": {"origins": "http://public_ip:3000"}})

app.register_blueprint(movies_api)
