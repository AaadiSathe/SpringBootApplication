
FROM node:16-alpine AS build


WORKDIR /app


COPY React-Demo/package*.json ./


RUN npm install


COPY React-Demo/ ./


RUN npm run build


FROM node:16-alpine


RUN npm install -g serve


WORKDIR /app


COPY --from=build /app/dist ./dist


EXPOSE 3000


CMD ["serve", "-s", "dist", "-l", "3000"]
