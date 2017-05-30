class Style < ApplicationRecord
  has_many :artworks
  has_many :exhibition_styles
  validates :name, presence: true
end
