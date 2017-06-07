class DashboardController < ApplicationController

  def dashboard_artist
    #@exhibitions = current_user.exhibitions
    authorize current_user
  end

  def dashboard_company
    #@bids = current_user.bids
    authorize current_user
    @exhibition = current_user.exhibitions.order('created_at DESC')
  end

  def dashboard_payment
    @exhibition = Exhibition.find(params[:id])
    @bid_to_pay = @exhibition.bids.find_by(status: "accepted")
    authorize current_user
  end
end
