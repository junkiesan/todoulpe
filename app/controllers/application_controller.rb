class ApplicationController < ActionController::Base
  include Pundit
  before_action :authenticate_user!
  after_action :verify_authorized, except: :index, unless: :devise_controller?
  # after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?


  private
  
  def skip_pundit?
    devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
  end
end
