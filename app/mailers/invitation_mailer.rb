class InvitationMailer < ActionMailer::Base
  default from: 'no-reply@sportive-diary.com'
  def invite(email, coach)
    @coach = coach

    mail(to: email, subject: 'Hooray! You have been invited to Sportive Diary!')
  end
end