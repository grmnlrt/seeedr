class ExhibitionsController < ApplicationController
  before_action :find_exhibition, only: [:show, :edit, :update, :destroy]

  def index
    @exhibitions = policy_scope(Exhibition).order(created_at: :desc).where.not(latitude: nil, longitude: nil)

    unless params[:localisation].nil?
      @exhibitions = Exhibition.near(params[:localisation], 50)
    end

    @hash = Gmaps4rails.build_markers(@exhibitions) do |exhibition, marker|
      marker.lat exhibition.latitude
      marker.lng exhibition.longitude
      marker.infowindow render_to_string(partial: "/exhibitions/map_box", locals: { exhibition: exhibition })
    end
  end

  def show
    @exhibitions_coordinates = { lat: @exhibition.latitude, lng: @exhibition.longitude }
  end


  def new
    @exhibition= Exhibition.new
    authorize @exhibition
    @durations = Exhibition::DURATIONS #datepicker update
    @all_categories = Category.all
    @all_styles = Style.all

  end


  def create
    @exhibition = Exhibition.new(exhibition_params)
    authorize @exhibition
    @exhibition.user = current_user
    @exhibition.end_date = @exhibition.start_date + @exhibition.duration.months #datepicker update
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
      redirect_to dashboard_company_users_path
    else
      render :edit
    end
  end

  def destroy
    @exhibition.destroy
    redirect_to dashboard_company_users_path, :notice => "Your exhibition has been deleted"
  end


  private

  def find_exhibition
    @exhibition = Exhibition.find(params[:id])
    authorize @exhibition
  end

  def exhibition_params
    params.require(:exhibition).permit(:title, :description, :address, :min_price, :user_id, :start_date, :end_date, :duration, photos: [])
  end

end
