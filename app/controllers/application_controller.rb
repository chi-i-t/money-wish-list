class ApplicationController < ActionController::Base
  def after_sign_in_path_for(resource)
    wishes_path
  end

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :incomes, :fixedcosts, :savings])
      devise_parameter_sanitizer.permit(:account_update, keys: [:name, :incomes, :fixedcosts, :savings])
    end
    

  private
    def sign_in_required
      redirect_to new_user_session_url unless user_signed_in?
    end
end
