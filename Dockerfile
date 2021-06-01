FROM ruby:3
ENV RAILS_ENV=production

LABEL Name=trailblazerService Version=0.0.1

EXPOSE 3000

# throw errors if Gemfile has been modified since Gemfile.lock
RUN bundle config --global frozen 1

WORKDIR /app
COPY . /app

COPY Gemfile Gemfile.lock ./
RUN bundle install

CMD ["rails", "s"]
