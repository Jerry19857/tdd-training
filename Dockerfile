FROM node:18.17.1-alpine3.18

# get dependencies playwright
FROM mcr.microsoft.com/playwright:focal

WORKDIR /app
COPY package.json /app/
COPY tests/ /app/tests/
COPY tsconfig.json /app/

# Get the needed libraries to run Playwright
RUN apt-get update && apt-get -y install libnss3 libatk-bridge2.0-0 libdrm-dev libxkbcommon-dev libgbm-dev libasound-dev libatspi2.0-0 libxshmfence-dev

# Install the dependencies in Node environment
RUN npm install