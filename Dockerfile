FROM ubuntu:16.04

MAINTAINER Andre Elizondo "andre@datadog.com"

RUN apt-get update -y && \
    apt-get install -y python-pip python-dev apache2-utils

COPY ./requirements.txt /app/requirements.txt

WORKDIR /app

RUN pip install -r requirements.txt

COPY . /app

# Datadog Configuration
ENV DD_AGENT_HOST=datadog-agent
ENV DD_TRACE_ANALYTICS_ENABLED=true
ENV DATADOG_SERVICE_NAME=dog-facts-inc
ENV DD_LOGS_INJECTION=false
ENV DD_RUNTIME_METRICS_ENABLED=true

EXPOSE 5000

ENTRYPOINT [ "ddtrace-run" ]

CMD [ "flask", "run", "--host=0.0.0.0" ]