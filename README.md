# EndDevNodeBase

[![Build Status](https://travis-ci.org/vfalies/EnvDevNodeBase.svg?branch=master)](https://travis-ci.org/vfalies/EnvDevNodeBase)

EndDevNodeBase is a Node container designed to be used like a base for a utilisation into the [EnvDev project](https://vfac.fr/projects/envdev).
The utlisation outside this project is naturally possible.

## Images

Three Node versions are available through image's tags:

- 13.6
- 12.14
- 10.18

The latest version of EndDevNodeBase (latest) (`vfac/envdevnodebase`) is a image with the last version of Node available.
Each versions exist in Alpine version to limit the image size.

## JS Tool

7 globals JS tools are available throught this container :

- NPM (7.5.2)
- Grunt (1.3.2)
- Gulp (4.0.2)
- Yarn (1.22.5)
- Typescript (3.7.5)
- Create-React-App (4.0.2)
- Nodemon (2.0.7)
- Expo-cli (4.1.6)