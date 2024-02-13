class UserMailer < ApplicationMailer
  default from: 'notifications@messaging_app.com'

  def weekly_message_update_email
    @user = params[:user]
    @total_messages = params[:total_messages]
    @total_since_been_gone = params[:total_since_been_gone]

    mail(to: @user.email, subject: 'Weekly message update') do |format|
      format.text { render plain: "Hello here are you stats for last week. Total messages sent last week
#{@total_messages}
Total messages since you last signed in at #{@user.last_sign_in_at} was #{@total_since_been_gone}" }
    end
  end
end
