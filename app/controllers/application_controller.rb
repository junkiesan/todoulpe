class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  helper_method :current_user
  include Pundit
  after_action :verify_authorized, except: :index, unless: :devise_controller?
  after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?


  private
  
  def skip_pundit?
    devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
  end
end
