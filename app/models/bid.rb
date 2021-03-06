class Bid < ApplicationRecord

#money rails
  monetize :price_cents

  belongs_to :user
  belongs_to :exhibition
  validates :user_id, :exhibition_id, presence: true
  validates :status, inclusion: { in: ["pending", "rejected", "accepted"] }
end
