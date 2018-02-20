FROM python:3.5.2
RUN mkdir /app
WORKDIR /app/
ADD blog /app/blog
ADD manage.py /app/
ADD db.sqlite3 /app/
COPY entrypoint.sh /app/
RUN ls -la
COPY requirements.txt /app/
RUN pip install -r requirements.txt
RUN python manage.py migrate
EXPOSE 8000
ENTRYPOINT '/app/entrypoint.sh'
