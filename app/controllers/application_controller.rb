class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery with: :exception

  after_action :verify_authorized, except: :index, unless: :devise_controller?
  after_action :verify_policy_scoped, only: :index, unless: :devise_controller?

  before_action :authenticate_user!
end
