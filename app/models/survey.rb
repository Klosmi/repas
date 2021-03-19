class Survey < ApplicationRecord
  belongs_to :event
  belongs_to :guest
  after_create :send_survey_email

  private

  def send_survey_email
    GuestMailer.with(guest: self).survey.deliver_now
  end

end
