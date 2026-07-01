FROM alpine:latest
COPY secrets.txt /leaked.txt
RUN cat /leaked.txt
CMD ["echo", "done"]
