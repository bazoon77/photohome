class RegistrationsController < Devise::RegistrationsController
  before_filter :update_sanitized_params, if: :devise_controller?

  

  # layout "user_profile_layout", except: [:new]

  def update_sanitized_params
    devise_parameter_sanitizer.for(:sign_up) {|u| u.permit(:name, :last_name, :login, :about, :email, :country, :password, :password_confirmation,:avatar,:terms_of_service, :birth_date)}
  end


 protected

    def after_update_path_for(resource)
      user_profile_path(resource)
    end

end
