FROM python:3.9
WORKDIR /app
ADD . /app
RUN pip install -r requirements.txt
EXPOSE 8081
# CMD ["tail", "-f", "/dev/null"]
CMD ["python", "main.py"]