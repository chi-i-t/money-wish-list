class RecordsController < ApplicationController
  before_action :sign_in_required, only: [:index]
  before_action :set_record, only: [:edit, :update, :destroy]
  
  def index
    @record = Record.new
    @records = Record.all

    if params[:id].present?
      @record = Record.find(params[:id])
    else
      @record = Record.new
    end

    @total_cost = current_user.records.sum(:cost)
    @user_balance = current_user.incomes - (current_user.fixedcosts + current_user.savings)
    @record_balance = @user_balance - @total_cost
    
  end


  def create
    Record.create(record_params)
    redirect_to records_path
  end
  

  def update
    @record.update(record_params)
    redirect_to request.referer
  end

  def destroy
    @record.destroy
    redirect_to request.referer
  end


  private

  def set_record
    @record = Record.find(params[:id])
  end


  def record_params
    params.require(:record).permit(:month, :content, :cost).merge(user_id: current_user.id)
  end
end
