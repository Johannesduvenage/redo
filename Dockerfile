FROM node:8.16.2

ENV HOST localhost
ENV PORT 3000

# Create app directory
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

# Install GYP dependencies globally, will be used to code build other dependencies
RUN npm install -g --production node-gyp && \
    npm cache clean --force

# Install Gekko dependencies
COPY package.json .
RUN npm install --production && \
    npm install --production redis@0.10.0 talib@1.0.2 tulind@0.8.7 pg && \
    npm cache clean --force

# Install Gekko Broker dependencies
WORKDIR exchange
COPY exchange/package.json .
RUN npm install --production && \
    npm cache clean --force
WORKDIR ../

# Install Gekko everything ells
RUN npm install mathjs && \
    npm install twilio && \
    npm install fs-extra && \
    npm install joi && \     
    npm install neataptic && \
    npm install synaptic && \
    npm install events && \
    npm install numbro && \
    npm install fs && \
    npm install semver && \
    npm install commander && \
    npm install gauss && \
    npm install irc && \
    npm install emailjs && \
    npm install prompt-lite && \
    npm install zero-fill && \
    npm install lodash.ismatch && \
    npm install talib-promise && \
    npm install sync-request && \
    npm cache clean --force


# Bundle app source
COPY . /usr/src/app

EXPOSE 3000
RUN chmod +x /usr/src/app/docker-entrypoint.sh
ENTRYPOINT ["/usr/src/app/docker-entrypoint.sh"]

  #  CMD ["--config", "config.js", "--ui"]

# node gekko --config config.js

  CMD ["--config", "config.js"]
# node gekko --config config.js

