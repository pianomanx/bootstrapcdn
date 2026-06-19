FROM node:24-slim

ENV NODE_ENV=production

RUN apt-get update \
    && apt-get install -y --no-install-recommends curl \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir /app && chown node:node /app

WORKDIR /app

COPY --chown=node:node . .

USER node

RUN npm ci --omit=dev && rm -f config/*.bak && npm cache clean --force

EXPOSE 3333

CMD ["node", "bin/www.js"]
