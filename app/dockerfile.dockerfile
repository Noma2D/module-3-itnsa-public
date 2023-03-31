FROM alpine:latest

RUN apt update && apt install nginx python3 pip

RUN mkdir /app
WORKDIR /app
COPY /app/files/default.sh /etc/nginx/sites-avaible/default
COPY /app/files/nginx.conf /etc/nginx/nginx.conf/
COPY /app/files/snakeoil.conf /etc/nginx/snippets/snakeoil.conf
COPY /app/. /app/.

RUN pip install --no-cache-dir -r /app/requirements.txt

EXPOSE 80 443

CMD ["python", "/app/app.py"]