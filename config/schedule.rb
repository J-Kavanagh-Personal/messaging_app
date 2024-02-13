# frozen_string_literal: true

set :output, "log/cron_log.log"
every 1.week do
  rake "users:send_email RAILS_ENV=development"
end