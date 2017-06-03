class Usermailer < ApplicationMailer
  default from: 'notifications@example.com'
  def welcome_email(row,userrow)
    @user = "somename"
    @insider=row
    @url  = 'http://example.com/login'
    mail(to: userrow.user_email, subject: 'Welcome to My Awesome Site')
   end
end
