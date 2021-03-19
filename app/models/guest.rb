class Guest < ApplicationRecord
  belongs_to :event
  has_many :surveys
  # validates :email, presence: true, uniqueness: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
  after_create :create_survey
  after_create :send_survey_email

private

  def send_survey_email
    GuestMailer.with(guest: self, event:self.event, survey:self.survey.last).survey.deliver_now
  end

  def create_survey
    Survey.create!(guest_id:self.id, event_id:self.event.id)
  end



end





