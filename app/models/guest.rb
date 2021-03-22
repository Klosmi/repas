class Guest < ApplicationRecord
  belongs_to :event
  has_many :surveys
  validates :email, presence: true #, uniqueness: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  #validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
  after_save :create_invit

  private

  def create_invit
    Survey.create(guest:self, event:self.event)
  end
  
end
