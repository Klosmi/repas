class Event < ApplicationRecord
  belongs_to :user
  has_many :guest
  has_many :survey
end
