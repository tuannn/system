class ShopAttachmentsController < ApplicationController
  
  def index
    
  end
  
  def new
    @shop_attachment = ShopAttachment.new
    @shop = Shop.find(params[:shop_id])
    respond_to do |format|
      format.html
    end
  end
  
  def create
    @shop = Shop.find(params[:shop_id])
    shop_attachment = ShopAttachment.new(shop_attachment_params);
    #shop_attachment.attachment = params[:attachment]
    shop_attachment.update_attributes(shop_id: @shop.id)
    respond_to do |format|
    if shop_attachment.save
      format.html { redirect_to shop_path(@shop), notice: "File was uploaded "}
    else
      format.html { redirect_to shop_path(@shop), notice: "Upload failed"}
    end
    
      
    end
  end
  
  def update
    
  end
  
  def show
    
  end
  
  def destroy
    
  end

private
  def shop_attachment_params
    params.require(:shop_attachment).permit(:description, :attachfile)
  end  
end
