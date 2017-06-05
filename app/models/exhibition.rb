class Exhibition < ApplicationRecord

  #Geocoder
  ###########
  geocoded_by :address
  after_validation :geocode, if: :address_changed?
  ###########
  DURATIONS = [3,6,9,12]

  has_attachments :photos, maximum: 3

  belongs_to :user
  has_many :bids, dependent: :destroy

  has_many :exhibition_categories
  has_many :categories, through: :exhibition_categories

  has_many :exhibition_styles
  has_many :styles, through: :exhibition_styles


  validates :start_date, :title, :min_price, presence: true
  validate :end_date_is_after_start_date
  validates :address, presence: true
  validates :duration, :inclusion => {:in => DURATIONS}

  def booked?
    self.bids.find_by(status: "accepted") ? true : false
  end

  def business_days_between(date1, date2)
    business_days = 0
    date = date2
    while date > date1
     business_days = business_days + 1 unless date.saturday? || date.sunday?
     date = date - 1.day
    end
    business_days
  end

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
