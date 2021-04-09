class User < ApplicationRecord
  has_many :events
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  private

  def send_welcome_email
    UserMailer.with(user: self).welcome.deliver_now
  end
end
