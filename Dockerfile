FROM python:3.11-slim-buster
WORKDIR /app
COPY . /app
RUN apt update -y && apt install ascii -y
RUN pip install -r requirements.txt
CMD ["python3", "app.py"]
