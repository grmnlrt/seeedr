class Order < ApplicationRecord
  belongs_to :exhibition

  monetize :amount_cents  # or :amount_pennies
end
