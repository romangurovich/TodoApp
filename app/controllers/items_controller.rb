class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    @item.assign_attributes(params[:item])

    if @item.save
      redirect_to item_path(@item)
    else
      flash.notice = @item.errors.full_messages
      render :edit
    end
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new
    @item.title = params[:item][:title]
    @item.description = params[:item][:description]
    @item.completed = params[:item][:completed]
    @item.project_id = params[:item][:project_id]

    if @item.save
      redirect_to item_path(@item)
    else
      flash.notice = @item.errors.full_messages
      render :new
    end
  end

  def destroy
    Item.find(params[:id]).destroy
    flash.notice = "Item deleted"
    redirect_to items_path
  end

end
