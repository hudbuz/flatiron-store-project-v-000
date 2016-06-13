class CategoriesController < ApplicationController

  def index

  end

  def show
    if current_user
      @user = current_user
      end
    @category = Category.find(params[:id])
    @items = @category.items.available_items

  end

end
