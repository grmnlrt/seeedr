class Artwork < ApplicationRecord
  belongs_to :user
  belongs_to :category
  belongs_to :style

  has_attachments :photos, maximum: 3
end
