FROM python:3
WORKDIR /usr/src/app
MAINTAINER Oscar Ponce de Leon Sanabria "oscarp.poncedeleonsanabria80@gmail.com"
RUN apt-get install git && pip install --root-user-action=ignore --upgrade pip && pip install --root-user-action=ignore django mysqlclient
RUN git clone https://github.com/oscarsanabria80/django_tutorial_oscar.git /usr/src/app && mkdir static
ADD ./polls.sh /usr/src/app/
RUN chmod +x /usr/src/app/polls.sh
ENV ALLOWED_HOSTS=*
ENV HOST=mariadb
ENV USUARIO=django
ENV CONTRA=django
ENV BASE_DATOS=django
ENV DJANGO_SUPERUSER_PASSWORD=admin
ENV DJANGO_SUPERUSER_USERNAME=admin
ENV DJANGO_SUPERUSER_EMAIL=admin@example.org
ENTRYPOINT ["/usr/src/app/polls.sh"]
