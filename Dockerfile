FROM node:12.14
LABEL maintainer="Vincent Faliès <vincent@vfac.fr>"

USER root

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

USER vfac:vfac

CMD ["tail","-f","/dev/null"]