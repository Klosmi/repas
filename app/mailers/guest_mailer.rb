class GuestMailer < ApplicationMailer


  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.guest_mailer.survey.subject
  #
  def survey
    @guest = params[:guest] # Instance variable => available in view
    @event = params[:event]
    @survey = params[:survey]
    mail(to: @guest.email, subject: 'Survey for your invitation')
  end
end

