class NewsController < ApplicationController
  def index
    respond_to do |format|
      format.html
    end
  end
  
  def new
    @news = News.new
     respond_to do |format|
      format.html
    end
  end
  
  def create
    @news = News.new(news_params)
    @news.update_attributes(user_id: current_user.id)
    
    respond_to do |format|
      if @news.save
        format.html { redirect_to news_index_path, notice: "News was created" }
      else
        format.html { render :new }
      end
      
    end
  end
  
  def show
    @news = News.find_by_id(params[:id])
    respond_to do |format|
      if @news
        @othernews = News.othernews(@news.id).order('created_at DESC').paginate(page: params[:page], per_page: 20)
        format.html 
      else
        format.html { redirect_to root_path, notice: "News is not existed" }
      end
      
    end
  end
  
  def edit
     respond_to do |format|
      format.html
    end
  end
  
  def update
     respond_to do |format|
      format.html
    end
  end
  
  def destroy
     respond_to do |format|
      format.html
    end
  end

private
  def news_params
    params.require(:news).permit(:user_id, :title, :content, :avatar, :shop_id)
  end  
end
