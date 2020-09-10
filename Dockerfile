FROM ruby:2.6-alpine3.12

RUN apk add --no-cache -X http://dl-cdn.alpinelinux.org/alpine/edge/testing hub
RUN apk add --update --no-cache git openssh bash
RUN gem update --system

RUN mkdir -p home
WORKDIR home
ADD / /
ENV BUNDLE_GEMFILE=/Gemfile
RUN bundle install
RUN git config --global user.email "dgolub@travix.com"
RUN git config --global user.name "dgolub-travix"

ENTRYPOINT [/entrypoint.sh]
