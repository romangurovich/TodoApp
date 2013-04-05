class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update_attributes(params[:user])
    redirect_to user_path(@user)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new
    @user.usernname = params[:user][:username]
    if @user.save
      redirect_to user_path(@user)
    else
      flash.now.notice = @user.errors.full_messages
      render :new
    end
  end

  def destroy
    User.find(params[:id]).destroy
  end

end
