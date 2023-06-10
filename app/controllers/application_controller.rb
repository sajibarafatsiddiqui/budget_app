# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  rescue_from ActionController::UnknownFormat do |_exception|
    redirect_to unauthenticated_root_path, alert: 'Invalid format'
  end
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  before_action do
    ActiveStorage::Current.url_options = { protocol: request.protocol, host: request.host, port: request.port }
  end


  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
