class ArtworksController < ApplicationController
  before_action :set_artwork, only: [:show, :edit, :update, :destroy]

  def show
    authorize @artwork
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
    authorize @artwork
    @all_categories = Category.all
    @all_styles = Style.all
  end

  def update
    authorize @artwork
    @artwork.update(artwork_params)
    if @artwork.save
      redirect_to artwork_path(@artwork)
    else
      render :new
    end
  end

  def destroy
    authorize @artwork
    @artwork.destroy
    redirect_to root_path
  end

  private

  def set_artwork
    @artwork = Artwork.find(params[:id])
  end

  def artwork_params
    params.require(:artwork).permit(:title, :description, :date, :category_id, :style_id)
  end
end
