class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
    @deals = @category.deals.order(created_at: :desc)
    @total_amount = @deals.sum(:amount)
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params.merge(user: current_user))
    #  @category.icon.attach(params[:category][:icon])
    if @category.save
      redirect_to categories_path, notice: 'Category was successfully created.'
    else
      render :new, status: 422
    end
  end

  private

  def category_params
    params.require(:category).permit(:Name, :icon)
  end
end
