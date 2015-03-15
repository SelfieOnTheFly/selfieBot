web: bundle exec thin start -p $PORT
worker: bundle exec sidekiq
stream: bundle exec thin start -R eventmachine.ru