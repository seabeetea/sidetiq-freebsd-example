class MyBasicJob
  include Sidekiq::Worker
  include Sidetiq::Schedulable

  recurrence { minutely }

  def perform
    logger.info "first last line: #{`last | head -1`.chomp}"
    `sleep 10 && last > /tmp/#{Time.now.to_i}`
  end
end
