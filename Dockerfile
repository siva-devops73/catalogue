FROM          node:18
RUN           mkdir /app
WORKDIR       /app
COPY          ./ /app
RUN           npm install
ENV MONGO =   true
ENV MONGO_URL = mongodb://mongodb-dev.devop73.store:27017/catalogue
ENTRYPOINT    ["/node", "/app/server.js"]
COPY          mongo.repo /etc/yum.repos.d/mongo.repo
RUN           \
                 apt-get update && \
                 apt-get install -y mongodb-org && \
                 rm -rf /var/lib/apt/lists/*
