# vi:syntax=conf

FROM alpine

COPY elasticsearch_exporter_amd64_linux /usr/local/bin/prometheus-elasticsearch-exporter

EXPOSE 9108

ENTRYPOINT ["/usr/local/bin/prometheus-elasticsearch-exporter"]
