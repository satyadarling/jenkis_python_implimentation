FROM python:3.10

WORKDIR /app

COPY . /app

RUN pip install -r requirements.txt

ENV PYTHONPATH=/app

CMD ["python", "-m", "pages.test_e2e_flow"]
