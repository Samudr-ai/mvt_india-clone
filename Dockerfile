# Use an official Ruby runtime as a parent image
FROM ruby:3.2.2

# Install dependencies
RUN apt-get update -qq && \
    apt-get install --no-install-recommends -y build-essential libpq-dev nodejs yarn

RUN curl -fsSL https://deb.nodesource.com/setup_16.x | bash - \
    && apt-get install -y nodejs yarn

# Set environment variables
ENV BUNDLE_PATH=/gems

# Set the working directory in the container
WORKDIR /myapp

# Copy the Gemfile and Gemfile.lock into the image
COPY Gemfile Gemfile.lock ./

# Install gems
RUN gem install bundler:2.4.10 && bundle install --verbose

# Install Rails
RUN gem install rails -v '7.1.3.4'

# Copy the main application code
COPY . .

# Install JavaScript dependencies
#RUN yarn install --verbose

# Precompile assets
#RUN bundle exec rake assets:precompile

# Add a script to be executed every time the container starts
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh

# Remove a potentially pre-existing server.pid for Rails.
RUN rm -f /myapp/tmp/pids/server.pid

# Expose port 3000 to the Docker host, so we can access it
EXPOSE 3000

# Define the entry point script that removes the server.pid file, runs database migrations, and starts Rails server
ENTRYPOINT ["entrypoint.sh"]

# Start the main process
CMD ["rails", "server", "-b", "0.0.0.0"]
