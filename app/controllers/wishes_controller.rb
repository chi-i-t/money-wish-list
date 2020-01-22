class WishesController < ApplicationController
  before_action :set_wish, only: [:show, :edit, :update, :destroy]
  def index
    @wish = Wish.new
    @wishes = Wish.all

    if params[:id].present?
      @wish = Wish.find(params[:id])
    else
      @wish = Wish.new

    end

    @total_cost = current_user.wishes.sum(:cost)
    @user_balance = current_user.incomes - (current_user.fixedcosts + current_user.savings)
    @wish_balance = @user_balance - @total_cost
  
  end
  
  def create
    Wish.create(wish_params)
    redirect_to wishes_path


  end

  def update
    @wish.update(wish_params)
    redirect_to request.referer
  end
  
  def destroy
    @wish.destroy
    redirect_to request.referer
  end


  private

  def set_wish
    @wish = Wish.find(params[:id])
  end

  def wish_params
    params.require(:wish).permit(:month, :content, :cost).merge(user_id: current_user.id)
  end

end
