FROM node:15.8-alpine
LABEL maintainer="Vincent Faliès <vincent@vfac.fr>"

USER root

WORKDIR /usr/app
COPY ./ /usr/app

# NPM last version
RUN npm i npm@latest -g

# Grunt
RUN npm install -g grunt-cli

# Gulp
RUN npm install -g gulp-cli \
    && npm install gulp -D

# Yarn
RUN apk add yarn

# Typescript
RUN npm install -g typescript

# Create-React-App
RUN npm install -g create-react-app

# Nodemon
RUN npm install -g nodemon

# Expo React-Native
RUN npm install -g expo-cli

# User creation
RUN adduser --system --uid 1003 vfac \
    && addgroup -g 1003 -S vfac

RUN apk add --update \
    curl \
    && rm -rf /var/cache/apk/*

# Install fixuid
RUN USER=vfac && \
    GROUP=vfac && \
    curl -SsL https://github.com/boxboat/fixuid/releases/download/v0.5/fixuid-0.5-linux-amd64.tar.gz | tar -C /usr/local/bin -xzf - && \
    chown root:root /usr/local/bin/fixuid && \
    chmod 4755 /usr/local/bin/fixuid && \
    mkdir -p /etc/fixuid && \
    printf "user: $USER\ngroup: $GROUP\n" > /etc/fixuid/config.yml
ENTRYPOINT ["fixuid", "-q"]

USER vfac:vfac

CMD ["tail","-f","/dev/null"]