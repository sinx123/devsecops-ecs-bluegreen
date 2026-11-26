import os
import socket

from flask import Flask, jsonify

app = Flask(__name__)
VERSION = os.getenv("APP_VERSION", "dev")


@app.get("/")
def index():
    return jsonify(
        message="DevSecOps blue/green demo",
        version=VERSION,
        host=socket.gethostname(),
        secret_loaded=bool(os.getenv("APP_SECRET")),  # proves Secrets Manager injection, never prints it
    )


@app.get("/health")
def health():
    return jsonify(status="healthy"), 200
