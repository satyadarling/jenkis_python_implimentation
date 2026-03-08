FROM python:3.10

WORKDIR /app

COPY . /app

# Install Chrome dependencies
RUN apt-get update && apt-get install -y \
    chromium \
    chromium-driver \
    wget \
    curl \
    unzip \
    && rm -rf /var/lib/apt/lists/*

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

ENV PYTHONPATH=/app

CMD ["pytest", "-s", "/app/pages/test_e2e_flow.py"]
