FROM alpine:latest
WORKDIR /app
COPY . .
RUN apk add --no-cache python3
CMD ["python3", "app.py"]
