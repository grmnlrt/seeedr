class ExhibitionCategory < ApplicationRecord
  belongs_to :exhibition
  belongs_to :category
end
