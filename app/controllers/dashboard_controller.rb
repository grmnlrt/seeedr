class DashboardController < ApplicationController

  def dashboard_artist
    @exhibitions = current_user.exhibitions
    authorize current_user
    # @exhibitions_booked = @exhibitions.where(book: true)
    # @exhibitions_pending = @exhibitions.where(book: nil)
    #@bookings = Booking.where(user_id: current_user.id)
  end

  def dashboard_company
    @bids = current_user.bids
    authorize current_user
    # @exhibitions_booked = @exhibitions.where(book: true)
    # @exhibitions_pending = @exhibitions.where(book: nil)
    #@bookings = Booking.where(user_id: current_user.id)
  end

end
