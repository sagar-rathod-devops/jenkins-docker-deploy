FROM python:3.12-slim
WORKDIR /app
RUN rm -rf ./*
COPY app/ .
EXPOSE 8000
CMD ["python3", "-m", "http.server", "8000"]