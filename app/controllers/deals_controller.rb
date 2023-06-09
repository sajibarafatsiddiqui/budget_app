class DealsController < ApplicationController

    def new
        @categories = Category.all
        @category = Category.find(params[:category_id])
        @deal = Deal.new
      end
    
  def create
    @deal = Deal.new(deal_params.merge(author: current_user))
    @category = Category.find(params[:category_id])
    if @deal.save
      @categories = Category.all
      @deal.categories << @category unless @deal.categories.include?(@category)
      @categories.each do |category|
       @deal.categories << category unless @deal.categories.include?(category)
      end
      redirect_to category_path(@category)
    else
      render :new
    end
  end

  private

  def deal_params
    params.require(:deal).permit(:name, :amount, category_ids: [])
  end
end
