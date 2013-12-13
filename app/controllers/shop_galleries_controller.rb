class ShopGalleriesController < ApplicationController
  def new
    @shop = Shop.find(params[:id]) if params[:id]
    @shopgallery = ShopGallery.new
      respond_to do |format|
        format.html
      end
  end

  def create
    @shopgallery = ShopGallery.new(gallery_params)
    if @shopgallery.save
      @shop = Shop.find(@shopgallery.shop_id)
      respond_to do |format|
        format.html { redirect_to shop_path(@shop), notice: "Image was uploaded"}
      end
    else
      format.html { render action: :new }
    end
  end

  private

  def gallery_params
    params.require(:shop_gallery).permit(:shop_id, :name, :description, :avatar)
  end
end
