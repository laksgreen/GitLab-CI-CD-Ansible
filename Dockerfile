#FROM dockerhub.infi.com/intel:v1.0.1
FROM node:latest
MAINTAINER thelinuxfaq@gmail.com
WORKDIR /docker-node
RUN mkdir /home/user/.ssh
COPY . /docker-node
COPY ./config /root/.ssh/config
RUN echo /home/user/.ssh/id_rsa > /home/user/.ssh/id_rsa && \
    chmod 400 /home/user/.ssh/id_rsa
RUN cd /docker-node && npm install
RUN npm install express --save
EXPOSE 3000:3000
CMD npm start
