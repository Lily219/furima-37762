class ApplicationController < ActionController::Base
  before_action :basic_auth
  before_action :configue_permitted_parameters, if: :devise_controller?

  private

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == 'admin' && password == '1111'
    end

    def configue_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname])
      devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name])
      devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name])
      devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name_kana])
      devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name_kana])
      devise_parameter_sanitizer.permit(:sign_up, keys: [:birthday])
    end
  end
end
