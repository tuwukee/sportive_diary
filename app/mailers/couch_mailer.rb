class CouchMailer < ActionMailer::Base
  default from: 'no-reply@sportive-diary.com'
  def welcome(couch)
    @couch = couch

    mail(to: @couch.email, subject: 'Welcome to Sportive Diary')
  end
end