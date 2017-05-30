class ExhibitionsController < ApplicationController
  before_action :find_exhibition, only: [:show, :edit, :update, :destroy]

  def index
    @exhibitions = policy_scope(Exhibition).order(created_at: :desc)
  end

  def show
    authorize @exhibition
  end

  def new
    @exhibition= Exhibition.new
    authorize @exhibition
    @all_categories = Category.all
    @all_styles = Style.all
  end


  def create
  @exhibition = Exhibition.new(exhibition_params)
  authorize @exhibition
  @exhibition.user = current_user
    if @exhibition.save
      redirect_to exhibition_path(@exhibition)
    else
      render :new
    end
  end

  def edit
    authorize @exhibition
  end

  def update
    authorize @exhibition
    @exhibition.update(exhibition_params)
    @exhibition.save
    redirect_to exhibition_path(@exhibition)
  end

  def destroy
    authorize @exhibition
    @exhibition.destroy
    redirect_to exhibitions_path, :notice => "Your exhibition has been deleted"
  end


  private

  def find_exhibition
    @exhibition = Exhibition.find(params[:id])
  end

  def exhibition_params
    params.require(:exhibition).permit(:title, :description, :address, :min_price, :user_id, :start_date, :end_date)
  end


end
