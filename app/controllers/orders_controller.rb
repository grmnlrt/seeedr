class OrdersController < ApplicationController
  def show
    @order = Order.where(state: 'paid').find(params[:id])
    authorize @order
  end

  def create
    @bid= Bid.find(params[:bid_id])
    @order  = Order.create!(exhibition_id: @bid.exhibition.id, amount: @bid.exhibition.price, state: 'pending')
    authorize @order
    redirect_to new_order_payment_path(@order)
  end
end
