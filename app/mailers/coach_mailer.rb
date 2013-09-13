class CoachMailer < ActionMailer::Base
  default from: 'no-reply@sportive-diary.com'
  def welcome(coach)
    @coach = coach

    mail(to: @coach.email, subject: 'Welcome to Sportive Diary')
  end
end