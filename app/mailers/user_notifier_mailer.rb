class UserNotifierMailer < ApplicationMailer
  default :from => 'diana@workals.com'

  # send a signup email to the user, pass in the user object that   contains the user's email address
  def send_signup_email(user)
    @user = user
    mail( :to => @user.email,
    :subject => 'Welcome to Workals' )
  end

  def send_email(user)
    @user = user

    mail(:to => @user.email,
         :subject => "Password Reset",
         :body => "Copy the verification code: #")
  end
end
