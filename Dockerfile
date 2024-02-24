FROM node:lts-buster
RUN apt-get update && \
  apt-get install -y \
  ffmpeg \
  imagemagick \
  webp && \
  apt-get upgrade -y && \
  rm -rf /var/lib/apt/lists/*
RUN git clone https://github.com/INR-L/inrl-bot-md /beta
WORKDIR /beta
RUN yarn install --network-concurrency 1
CMD ["node", "index.js"]
