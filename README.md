# Welcome to Movie App

## Getting Started

#### Install the dependencies

1. Use your ruby version manager to install the ruby version in `.ruby-version`.

2. Install Docker https://docs.docker.com/install/

#### Build

`$ docker-compose build`

#### Database setup

`$ docker-compose run movie_app rake db:setup`

#### Running RSpec

`$ docker-compose run movie_app rspec spec`

#### Style linting

`$ docker-compose run movie_app rubocop -R`

#### Running the application locally

1. `$ docker-compose up`

2. Visit `http://localhost:3000`
