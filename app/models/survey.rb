class Survey < ApplicationRecord
  belongs_to :event
  belongs_to :guest
  #after_save :send_invit_email

  private

  def send_invit_email


  end
end


