FROM alpine:latest

RUN apk add --no-cache curl && \
    rm -rf /var/cache/apk/*

COPY update-dyn.sh .

ENTRYPOINT ["sh", "update-dyn.sh"]
