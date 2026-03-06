FROM python:3.10

WORKDIR /app

COPY . /app

RUN pip install -r requirements.txt

ENV PYTHONPATH=/app

CMD ["pytest", "-s", "/app/pages/test_e2e_flow.py"]
