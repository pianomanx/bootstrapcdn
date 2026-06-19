FROM node:24-slim

ENV NODE_ENV=production

RUN mkdir /app && chown node:node /app

WORKDIR /app

COPY --chown=node:node . .

USER node

RUN npm ci --omit=dev && rm -f config/*.bak && npm cache clean --force

EXPOSE 3333

CMD ["node", "bin/www.js"]
