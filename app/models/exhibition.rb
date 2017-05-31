class Exhibition < ApplicationRecord
  DURATIONS = [3,6,9,12]
  has_attachments :photos, maximum: 3

  belongs_to :user
  has_many :bids

  has_many :exhibition_categories
  has_many :categories, through: :exhibition_categories

  has_many :exhibition_styles
  has_many :styles, through: :exhibition_styles


  validates :start_date, :title, :min_price, presence: true
  validate :end_date_is_after_start_date
  validates :duration, :inclusion => {:in => DURATIONS}


  #######
  private
  #######

  def end_date_is_after_start_date
    return if end_date.blank? || start_date.blank?

    if end_date < start_date
      errors.add(:end_date, "cannot be before the start date")
    end
  end
end
