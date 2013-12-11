require 'will_paginate/array'
class UsersController < ApplicationController
  load_and_authorize_resource :except => [:create, :update]
  
  def new
    @user = User.new
    respond_to do |format|
      format.html
    end
  end
  
  def index
    @user = User.order(:email).all.paginate(page: params[:page], per_page: 10)
    respond_to do |format|
      format.html
    end
  end
  
  def create
    @user = User.new(user_params)
    @user.update_attributes(password: "12345678", password_confirmation: "12345678")
    
    respond_to do |format|
      if @user.save
        format.html {redirect_to users_path, notice: "User was created"} 
      else
        format.html {render :new}
      end
    end
  end
  
  def show
    @user = User.find(params[:id])
    respond_to do |format|
      format.html
    end
  end
  
  def edit
    respond_to do |format|
      format.html
    end
  end
  
  def update
    @user = User.find(params[:id])
    respond_to do |format|
      if @user.update_attributes(user_params)
        format.html { redirect_to user_path(@user) }
      else
        format.html { render :edit }
      end
      
    end
  end
  
private
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :role, :avatar)
  end

end
