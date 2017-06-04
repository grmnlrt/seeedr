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
    @bid = Bid.new
  end

  def new_step_one
    @categories = Category.all
    authorize @categories
  end

  def new_step_two
    @selected_categories_id = params["selected_categories"].uniq.map(&:to_i)
    @categories = Category.find(@selected_categories_id)
    @categories.each { |category| authorize category }
  end

  def new
    @selected_categories_id = params["selected_categories"].uniq.map(&:to_i)
    @selected_styles_id = params["selected_styles"].uniq.map(&:to_i)
    @exhibition = Exhibition.new
    authorize @exhibition
    @durations = Exhibition::DURATIONS #datepicker update
    @all_categories = Category.all
    @all_styles = Style.all

  end


  def create
    @exhibition = Exhibition.new
    authorize @exhibition
    @exhibition.title = exhibition_params["title"]
    @exhibition.description = exhibition_params["description"]
    @exhibition.address = exhibition_params["address"]
    @exhibition.min_price = exhibition_params["min_price"]
    @exhibition.start_date = exhibition_params["start_date"]
    @exhibition.duration = exhibition_params["duration"]
    @exhibition.photos = exhibition_params["photos"]
    @exhibition.user = current_user
    @exhibition.end_date = @exhibition.start_date + @exhibition.duration.months
    exhibition_categories_ids = exhibition_params["categories"].split(" ")
    exhibition_styles_ids = exhibition_params["styles"].split(" ")
    exhibition_categories_ids.each do |category_id|
      @exhibition.categories << Category.find(category_id.to_i)
    end
    exhibition_styles_ids.each do |style_id|
      @exhibition.styles << Style.find(style_id.to_i)
    end
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
    params.require(:exhibition).permit(:title, :description, :address, :min_price, :user_id, :start_date, :end_date, :duration, :categories, :styles, photos: [])
  end

  def exhibition_create_param
    params.permit(:selected_categories, :selected_styles)
  end

end
