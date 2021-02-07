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

USER vfac:vfac

CMD ["tail","-f","/dev/null"]