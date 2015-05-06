require 'sidekiq'
require 'sidetiq'

Dir[File.join(File.dirname(__FILE__), 'workers', '*.rb')].each {|file| require file }

Sidekiq.logger.level = Logger::DEBUG

Sidekiq.options[:poll_interval] = 1
