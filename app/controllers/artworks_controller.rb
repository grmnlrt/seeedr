class ArtworksController < ApplicationController
  before_action :set_artwork, only: [:show, :edit, :update, :destroy]

  def show
  end

  def new
    @artwork = Artwork.new
    authorize @artwork
    @all_categories = Category.all
    @all_styles = Style.all
  end

  def create
    @artwork = Artwork.new(artwork_params)
    authorize @artwork
    @artwork.user = current_user
    if @artwork.save
      redirect_to artwork_path(@artwork)
    else
      render :new
    end
  end

  def edit
    @all_categories = Category.all
    @all_styles = Style.all
  end

  def update
    @artwork.update(artwork_params)
    if @artwork.save
      redirect_to artwork_path(@artwork)
    else
      render :edit
    end
  end

  def destroy
    @artwork.destroy
    redirect_to root_path
  end

  private

  def set_artwork
    @artwork = Artwork.find(params[:id])
    authorize @artwork
  end

  def artwork_params
    params.require(:artwork).permit(:title, :description, :date, :category_id, :style_id)
  end
end
