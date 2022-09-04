FROM node:latest
WORKDIR /app
ADD . /app
RUN npm install -g serve
EXPOSE 5001
CMD ["serve", "-l", "5000"]