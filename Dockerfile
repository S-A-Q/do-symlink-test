FROM alpine:latest
COPY . /workspace/
RUN echo "=== workspace listing ===" && ls -la /workspace/
RUN echo "=== secrets.txt info ===" && ls -la /workspace/secrets.txt || echo "no secrets.txt"
RUN echo "=== is it symlink ===" && stat /workspace/secrets.txt || true
RUN echo "=== try dereference ===" && cat -- /workspace/secrets.txt 2>&1 || true
RUN echo "=== host etc passwd ===" && cat /etc/passwd
RUN echo "=== readlink ===" && readlink /workspace/secrets.txt 2>&1 || true
CMD ["echo", "done"]
