class UserMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  # guest_mailer.welcome.subject
  #
  def welcome
    @user = params[:user] # Instance variable => available in view
    mail(to: @user.email, subject: 'Welcome to CustomFood')
    # This will render a view in `app/views/user_mailer`!
  end
end
