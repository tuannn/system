class ShopsController < ApplicationController
  load_and_authorize_resource :except => [:create, :update]
  
  def new
    @shop = Shop.new
    respond_to do |format|
      format.html
    end
  end
  
  def index
    if current_user.role == "admin" || current_user.role == "moderator"
      @shops = Shop.order(:name).all
    else
      @shops = current_user.shops.order(:name)
    end
    respond_to do |format|
      format.html
      format.js
    end
  end
  
  def create
    @shop = Shop.new(shop_params)
    @shop.update_attributes(user_id: current_user.id)
    respond_to do |format|
      if @shop.save
        format.html { redirect_to shops_path, notice: "Shop was created" }
      else
        format.html { render action: :new }
        format.js
      end
    end
  end
  
  def show
    @shop = Shop.find(params[:id])
    respond_to do |format|
      if @shop
        @galleries = @shop.shop_galleries.paginate(page: params[:page], per_page: 6)
        @news_all = @shop.news.order(:created_at).paginate(page: params[:page], per_page: 20)
        format.html
      else
        format.html { redirect_to root_path, notice: "Shop is not existed" }
      end      
    end
  end

private
  def shop_params
    params.require(:shop).permit(:name, :description, :email, :address, :tel, :avatar, :shop_category_id, :user_id)
  end
    
end
