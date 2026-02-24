class Reservation < ApplicationRecord
  belongs_to :book

  validates :email, presence: true
  validates :status, presence: true
end
