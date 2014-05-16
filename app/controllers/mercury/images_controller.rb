class Mercury::ImagesController < MercuryController
  include Authentication

  before_action :authenticate_admin!

  respond_to :json

  def create
    binding.pry
    @image = Image.new(image_params)
    @image.save
    respond_with @image
  end

  def destroy
    @image = get_image
    @image.destroy
    respond_with @image
  end

  private

  def get_image
    Image.find(params[:id])
  end

  def image_params
    params.require(:image).permit(:image)
  end
end
