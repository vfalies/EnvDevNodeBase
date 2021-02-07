FROM node:15.8
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
RUN apt-get update && apt-get install -y apt-transport-https ca-certificates \
    && curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
    && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
    && apt-get update && apt-get install --no-install-recommends yarn \
    && rm -rf /var/lib/apt/lists/*

# Typescript
RUN npm install -g typescript

# Create-React-App
RUN npm install -g create-react-app

# Nodemon
RUN npm install -g nodemon

# Expo React-Native
RUN npm install -g expo-cli

RUN npm i -f

# User creation
RUN useradd -U -m -r -o -u 1003 vfac

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