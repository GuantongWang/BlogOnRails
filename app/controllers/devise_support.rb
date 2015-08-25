module DeviseSupport
  
  def self.included(base)
    base.layout :layout_by_resource
    base.before_action :configure_permitted_parameters, if: :devise_controller?
  end

  def layout_by_resource
    if devise_controller?
      "blank"
    else
      "application"
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :phone
    devise_parameter_sanitizer.for(:sign_up) << :name
    devise_parameter_sanitizer.for(:sign_up) << :id_number

    devise_parameter_sanitizer.for(:sign_in) << :login
    # devise_parameter_sanitizer.for(:account_update) { |u|
    #   u.permit(:password, :password_confirmation, :current_password)
    # }
  end

end
