class BidsController < ApplicationController
  before_action :set_bid, only: [:show, :edit, :update, :destroy]

  def show
  end

  def new
    @bid = Bid.new
    authorize @bid
    @exhibitions = Exhibition.all
  end

  def create
    @bid = Bid.new(bid_params)
    @bid.user = current_user
    authorize @bid
    if @bid.save
     redirect_to bid_path(@bid)
    else
     render :new
    end
  end

  def edit
    @exhibitions = Exhibition.all
  end

  def update
    other_bids = @bid.exhibition.bids.where.not(id: @bid.id) #array excluant la bid confirmee par la company
    if @bid.update(bid_params)
      if bid_params[:status] == "accepted"
        other_bids.update_all(status: "pending")
        redirect_to dashboard_company_users_path
      elsif bid_params[:status] == "pending"
        redirect_to dashboard_company_users_path
      else
        redirect_to bid_path(@bid)
      end

    else
      render :edit
    end
  end

  def destroy
    @bid.destroy
    redirect_to dashboard_company_users_path
  end

  private

  def bid_params
    params.require(:bid).permit(:status, :price, :user_id, :exhibition_id)
  end

  def set_bid
    @bid = Bid.find(params[:id])
    authorize @bid
  end
end
