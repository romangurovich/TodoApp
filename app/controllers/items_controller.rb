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
      flash.notice = "#{@item.title} updated"
      redirect_to item_path(@item)
    else
      flash.now.alert = @item.errors.full_messages
      render :edit
    end
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(params[:item])

    if @item.save
      flash.notice = "#{@item.title} created"
      redirect_to item_path(@item)
    else
      flash.now.alert = @item.errors.full_messages
      render :new
    end
  end

  def destroy
    Item.find(params[:id]).destroy
    flash.notice = "Item deleted"
    redirect_to items_path
  end

end
