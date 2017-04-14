# handles sending emails
class UserMailer < ApplicationMailer
  default from: 'notifications@definitelynotfacebook.com'

  def welcome_email(user)
    @user = user
    @url = 'localhost:3000/users/sign_in'
    mail(to: @user.email, subject: 'Welcome to Odin Book')
  end
end
