class ExhibitionsController < ApplicationController
  before_action :find_exhibition, only: [:show, :edit, :update, :destroy]

  def index
    @exhibitions = policy_scope(Exhibition).order(created_at: :desc).where.not(latitude: nil, longitude: nil)

    @hash = Gmaps4rails.build_markers(@exhibitions) do |geo, marker|
      marker.lat geo.latitude
      marker.lng geo.longitude
    end
  end

  def show
    @exhibitions_coordinates = { lat: @flat.latitude, lng: @flat.longitude }
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
  end

  def update
    @exhibition.update(exhibition_params)
    if @exhibition.save
      redirect_to exhibition_path(@exhibition)
    else
      render :edit
    end
  end

  def destroy
    @exhibition.destroy
    redirect_to exhibitions_path, :notice => "Your exhibition has been deleted"
  end


  private

  def find_exhibition
    @exhibition = Exhibition.find(params[:id])
    authorize @exhibition
  end

  def exhibition_params
    params.require(:exhibition).permit(:title, :description, :address, :min_price, :user_id, :start_date, :end_date, photos: []
      )
  end



end
