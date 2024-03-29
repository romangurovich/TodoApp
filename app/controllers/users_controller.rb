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
    @user.assign_attributes(params[:user])

    if @user.save
      flash.notice = "#{@user.username} updated"
      redirect_to user_path(@user)
    else
      flash.now.alert = @user.errors.full_messages
      render :edit
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])

    if @user.save
      flash.notice = "#{@user.username} created"
      redirect_to user_path(@user)
    else
      flash.now.alert = @user.errors.full_messages
      render :new
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash.notice = "User deleted"
    redirect_to users_path
  end

end
