FROM google/cloud-sdk:178.0.0-alpine
MAINTAINER Adam Wilmore awilmore@assemblypayments.com

# Hack for buildkite
#RUN sed -i 's/http\:\/\/dl-cdn.alpinelinux.org/https\:\/\/alpine.global.ssl.fastly.net/g' /etc/apk/repositories

# Useful tools
RUN apk update && \
      apk add --no-cache \
        openssl \
        curl \
        bash \
        wget \
        jq

# Install kubectl
RUN gcloud components install kubectl

# Install helm
RUN curl https://raw.githubusercontent.com/kubernetes/helm/master/scripts/get | bash
