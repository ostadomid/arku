FROM node:12-buster

WORKDIR /app
COPY package.json .
COPY yarn.lock .
RUN yarn
COPY . .
RUN bash setup.sh
CMD ["bash", "start.sh"]
