module Mercury
  class ImagesController < MercuryController
    include Authentication

    before_action :authenticate_admin!
    before_action :set_image, only: :destroy
    respond_to :json

    def create
      @image = Image.new(image_params)
      @image.save!
      respond_with @image
    end

    def destroy
      @image.destroy
      respond_with @image
    end

    private

    def set_image
      @image = Image.find(params[:id])
    end

    def image_params
      params.require(:image).permit(:image)
    end
  end
end
