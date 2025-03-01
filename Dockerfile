FROM python:3.11-alpine

WORKDIR /usr/src/app/config
COPY /config.yaml.example .

WORKDIR /usr/src/app
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1
ENV SCHEDULE None

COPY /requirements.txt .
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

COPY . .

CMD ["sh", "/usr/src/app/run.sh"]

