# docker built -t movie_app

FROM ruby:2.5.0

RUN apt-get update -qq && apt-get install -y build-essential nodejs
ENV INSTALL_PATH /movie_app
RUN mkdir $INSTALL_PATH
WORKDIR $INSTALL_PATH
COPY Gemfile $INSTALL_PATH/Gemfile
COPY Gemfile.lock $INSTALL_PATH/Gemfile.lock
RUN bundle install
COPY . $INSTALL_PATH

CMD foreman start
