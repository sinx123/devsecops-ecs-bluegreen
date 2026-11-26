import os
import sys

sys.path.insert(0, os.path.dirname(os.path.dirname(__file__)))

from app import app  # noqa: E402


def test_health():
    r = app.test_client().get("/health")
    assert r.status_code == 200 and r.json["status"] == "healthy"


def test_index_does_not_leak_secret(monkeypatch):
    monkeypatch.setenv("APP_SECRET", "super-secret-value")
    r = app.test_client().get("/")
    assert r.status_code == 200
    assert "super-secret-value" not in r.get_data(as_text=True)
    assert r.json["secret_loaded"] is True
