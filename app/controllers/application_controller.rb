class ApplicationController < ActionController::Base
  before_action :basic_auth, if: :production?

  def after_sign_in_path_for(resource)
    '/wishes'
  end

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :incomes, :fixedcosts, :savings])
      devise_parameter_sanitizer.permit(:account_update, keys: [:name, :incomes, :fixedcosts, :savings])
    end

  layout :layout_by_resource

  protected

  def layout_by_resource
    if devise_controller?
      "sub-layout"
    else
      "application"
    end
  end


  private

    def production?
      Rails.env.production?
    end

    def basic_auth
      authenticate_or_request_with_http_basic do |username, password|
        username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
      end
    end

    def sign_in_required
      redirect_to new_user_session_url unless user_signed_in?
    end


end
