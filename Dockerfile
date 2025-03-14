FROM node:lts-buster

RUN apt-get update && \
  apt-get install -y \
  ffmpeg \
  imagemagick \
  webp && \
  apt-get upgrade -y && \
  rm -rf /var/lib/apt/lists/*

COPY package.json .

RUN npm install && npm install -g qrcode-terminal pm2
RUN npm install dotenv
RUN npm install ytdl-core
RUN npm install axois


COPY . .

EXPOSE 3000


CMD ["pm2-runtime", "start", "index.js"]
