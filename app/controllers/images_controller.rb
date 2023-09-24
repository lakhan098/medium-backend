class ImagesController < ApplicationController
    before_action :authenticate_user

  def create
    image = @current_user.images.build(image_params)

    if image.save
      render json: { image_url: url_for(image) }, status: :created
    else
      render json: { errors: image.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def image_params
    params.require(:image).permit(:file)
  end
end
