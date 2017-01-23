SHELL := /bin/bash

HASH := $(shell git rev-parse --short head)
DATE := $(shell date -u '+%Y-%m-%dT%H:%M:%SZ')

elasticsearch_exporter:
	go get -v github.com/prometheus/client_golang/prometheus
	go build -o elasticsearch_exporter -ldflags '-X main.BuildHash=$(HASH) -X main.BuildDate=$(DATE)' .

.PHONY: docker
docker: TAG?=prometheus-elasticsearch-exporter
docker:
	GOARCH=amd64 GOOS=linux go build -o elasticsearch_exporter_amd64_linux -ldflags '-X main.BuildHash=$(HASH) -X main.BuildDate=$(DATE)' .
	docker build -t $(TAG) .
	#docker push $(TAG)
