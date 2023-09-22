# Version. Can change in build progress
ARG GCLOUD_SDK_VERSION=183.0.0-alpine

# Use google cloud sdk
FROM google/cloud-sdk:$GCLOUD_SDK_VERSION
MAINTAINER jianbinli2018

# Install JAVA 8 and Pubsub Component (https://cloud.google.com/pubsub/docs/emulator)
RUN apk --update add openjdk8-jre
RUN gcloud components install pubsub-emulator beta --quiet

VOLUME /opt/data

COPY start .

EXPOSE 8432

ENTRYPOINT ["./start"]