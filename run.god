DIR = '/home/user/git/sidetiq-freebsd-example'

God.watch do |sidekiq|
  sidekiq.dir = DIR
  sidekiq.name = 'sidekiq'
  sidekiq.log = 'sidekiq.log'
  sidekiq.start = 'bundle exec sidekiq -r ./server.rb'
  sidekiq.keepalive
end

God.watch do |web|
  web.dir = DIR
  web.name = 'web'
  web.start = 'bundle exec rackup'
  web.keepalive
end
