class PlansController < ApplicationController
  before_action :sign_in_required, only: [:index]
  before_action :set_plan, only: [:edit, :update, :destroy]
  
  def index
    @plan = Plan.new
    @plans = Plan.all

    if params[:id].present?
      @plan = Plan.find(params[:id])
    else
      @plan = Plan.new
    end

    @total_cost = current_user.plans.sum(:cost)
    @user_balance = current_user.incomes - (current_user.fixedcosts + current_user.savings)
    @plan_balance = @user_balance - @total_cost
    
  end


  def create
    Plan.create(plan_params)
    redirect_to plans_path
  end
  

  def update
    @plan.update(plan_params)
    redirect_to request.referer
  end

  def destroy
    @plan.destroy
    redirect_to request.referer
  end


  private

  def set_plan
    @plan = Plan.find(params[:id])
  end


  def plan_params
    params.require(:plan).permit(:month, :content, :cost).merge(user_id: current_user.id)
  end
end
