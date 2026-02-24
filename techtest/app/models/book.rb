class Book < ApplicationRecord
  has_many :reservations

  validates :title, :author, presence: true
  validates :status, inclusion: { in: %w[available reserved] }
end
