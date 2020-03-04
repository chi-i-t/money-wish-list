class UsersController < ApplicationController
  def show
    
    @user = User.find(params[:id])
    @records = @user.records
    
    @chart = @records.pluck(:content, :cost)

    @total_cost = current_user.records.sum(:cost)
    @user_balance = current_user.incomes - (current_user.fixedcosts + current_user.savings)
    @record_balance = @user_balance - @total_cost

  end

  
end
