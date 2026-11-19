FROM node:22-alpine
WORKDIR /app
COPY package.json ./
RUN npm install --omit=dev
COPY server.js ./
COPY public ./public
RUN sed -i "s#'/api/#'api/#g" public/index.html public/register.html
RUN addgroup -S manager && adduser -S manager -G manager && mkdir -p /data && chown -R manager:manager /app /data
USER manager
ENV NODE_ENV=production PORT=8080 DATA_DIR=/data
EXPOSE 8080
CMD ["node","server.js"]
