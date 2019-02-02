# Based on alpine 3.7 and erlang 21
FROM elixir:1.8-alpine

# Notes about packages:
#   * build-base: for compiling mix deps
#   * git: for fetching some mix deps
RUN echo \
  # Install alpine packages
  && apk update --no-cache \
  && apk add --no-cache \
  build-base \
  git \
  openssh \
  bash \
  bash-completion \
  nodejs \
  nodejs-npm

# Install hex + rebar
RUN echo \
  && mix local.hex --force \
  && mix local.rebar --force

RUN echo \
  npm install -g brunch

# COPY .ssh /root/.ssh
# RUN chmod 400 /root/.ssh/*

WORKDIR /code

ARG FORCE_SSL=false
ARG MIX_ENV=prod

COPY config/config.exs config/
COPY config/dev.exs config/
COPY config/test.exs config/
COPY config/prod.exs config/

COPY mix.exs .
COPY mix.lock .

RUN mix deps.get && \
  mix deps.compile

COPY . .

RUN MIX_ENV="${MIX_ENV}" mix compile
# RUN cd assets && npm install && brunch build && cd ..
RUN cd assets && npm install && cd ..

RUN mkdir -p priv/static
RUN MIX_ENV="${MIX_ENV}" mix phx.digest
