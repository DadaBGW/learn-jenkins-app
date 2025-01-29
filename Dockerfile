FROM mcr.microsoft.com/playwright:v1.39.0-jammy
WORKDIR /usr/app
COPY ./ /usr/app
RUN npm install
RUN npm install -g netlify-cli node-jq serve