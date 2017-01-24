class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery with: :exception

  after_action :verify_authorized, except: :index, unless: :devise_controller?
  after_action :verify_policy_scoped, only: :index, unless: :devise_controller?

  def after_sign_in_path_for(resource)
    characters_path
  end

end
