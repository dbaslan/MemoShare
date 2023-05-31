FROM python:3.10.10

ENV PYTHONDONTWRITEBYTECODE 1 
ENV PYTHONUNBUFFERED 1 

WORKDIR /code 

RUN apt-get update && apt-get install -y --no-install-recommends postgresql-client 
  
COPY requirements.txt /code/ 
RUN pip install --upgrade pip 
RUN pip install --no-cache-dir -r requirements.txt 

COPY . /code/ 
  
EXPOSE 8000 
  
CMD sh -c 'python manage.py makemigrations && python manage.py migrate && python manage.py runserver 0.0.0.0:8000'