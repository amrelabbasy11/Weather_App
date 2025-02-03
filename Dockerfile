
FROM python:3.9-slim

WORKDIR /app

COPY requirements.txt .

RUN pip install -r requirements.txt

COPY . .

RUN python -c "import app; app.init_db()"

EXPOSE 5000

CMD ["python", "app.py"]

