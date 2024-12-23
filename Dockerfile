FROM python:3.12.7-slim-buster
WORKDIR /app
COPY • /app
RUN
RUN apt update -y && apt install ascli - y
RUN pip install -r requirements.txt
CMD ["python3", "app-py"]