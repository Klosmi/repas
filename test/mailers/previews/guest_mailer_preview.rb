# Preview all emails at http://localhost:3000/rails/mailers/guest_mailer
class GuestMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/guest_mailer/survey
  def survey
    guest = Guest.first
    GuestMailer.with(guest: guest).survey


end

