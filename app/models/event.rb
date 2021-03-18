class Event < ApplicationRecord
  belongs_to :user
  has_many :guests
  has_many :surveys
end
