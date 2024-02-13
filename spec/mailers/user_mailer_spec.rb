# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UserMailer, type: :mailer do
  describe "weekly_message_update_email" do

    let(:total_messages) { 10 }
    let(:total_since_been_gone) { 10 }
    let(:user) { FactoryBot.build(:user) }
    let(:params) { { user: user, total_messages: total_messages, total_since_been_gone:
      total_since_been_gone }}
    let(:mail) { UserMailer.with(params).weekly_message_update_email }

    it "renders the headers" do
      expect(mail.subject).to eq("Weekly message update")
      expect(mail.to).to eq(["#{FactoryBot.build(:user).email}"])
      expect(mail.from).to eq(['notifications@messaging_app.com'])
    end

    it "renders the body" do
      expect(mail.body).to match("Hello here are you stats for last week. Total messages sent last week
#{total_messages}
Total messages since you last signed in at #{user.last_sign_in_at} was #{total_since_been_gone}")
    end
  end
end
