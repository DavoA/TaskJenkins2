FROM python:3.9-slim

COPY script.py /app/script.py

CMD ["python", "/app/script.py"]
