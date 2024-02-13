require 'rake'
require 'devise'
require_relative '../../app/models/application_record'
require_relative '../../app/models/message'
require_relative '../../app/models/user'
require_relative '../../app/mailers/user_mailer'

namespace :users do
  desc "Sends emails to the users regarding their stats"
  task :send_email => :environment do
    total_messages = Message.where("created_at < ?", 1.week.ago )
    User.all.each do |user|
      total_messages_since_last_sign_in = Message.where("created_at < ?", user.last_sign_in_at)
      UserMailer.with(user: user,
                      total_messages: total_messages,
                      total_since_been_gone: total_messages_since_last_sign_in).weekly_message_update_email.deliver_now
    end
  end

end

Rake::Task['users:send_email'].execute
