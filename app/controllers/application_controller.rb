class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  include DeviseSupport
  
  before_action :set_dirs

  def set_dirs
    
  end
end
