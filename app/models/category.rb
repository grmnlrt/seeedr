class Category < ApplicationRecord
  has_many :artworks
  validates :name, presence: true
end
