# COMPILE IMAGE
FROM node:15.14.0-buster AS compile-image
LABEL maintainer="green2cerberuz@gmail.com"

ARG USER_ID
ARG GROUP_ID
ARG USERNAME

ENV APP_HOME /usr/src
WORKDIR $APP_HOME

# COPY all data from project directory
COPY ./package.json yarn.loc[k]  $APP_HOME/

# RUN npm install yarn
RUN yarn install

COPY . $APP_HOME
RUN ./scripts/user.sh && chown -R $USER_ID:$GROUP_ID $APP_HOME

USER $USERNAME









