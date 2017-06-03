module ArtworkHelper
  def artwork_picture(artwork)
    if artwork.photos.first
      artwork.photos.first.path
    else
      image_path "no-picture.png"
    end
  end
end
