FROM python:2.7
ENV PYTHONUNBUFFERED 1
RUN mkdir /app
WORKDIR /app
ADD requirements.txt /app/
RUN pip install -r requirements.txt
ADD app/ /app/
EXPOSE 8000

# cron for Twitter feed
RUN apt-get update && apt-get install -y cron && apt-get clean && rm -fr /var/lib/apt/lists/* /tmp/* /var/tmp/*
ADD mezzanine-twitter.cron /etc/cron.d/mezzanine-twitter.cron
RUN crontab /etc/cron.d/mezzanine-twitter.cron
RUN cron

CMD ["/app/run.sh"]
