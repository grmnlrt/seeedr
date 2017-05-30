class BidsController < ApplicationController
  before_action :set_bid, only: [:show, :edit, :update]

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
    @bid.update(bid_params)
    if @bid.save
      redirect_to bid_path(@bid)
    else
      render :edit
    end
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
