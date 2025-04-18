FROM --platform=linux/amd64 devopsfaith/krakend:2.8

COPY krakend.json /etc/krakend/krakend.json

ENV TZ=Asia/Bangkok

HEALTHCHECK --interval=30s --timeout=5s --retries=3 CMD wget -q --spider http://localhost:8080/__health || exit 1

EXPOSE 8080

CMD ["krakend", "run", "-c", "/etc/krakend/krakend.json"]