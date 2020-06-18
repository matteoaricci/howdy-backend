class ApplicationController < ActionController::API
    respond_to :html, :json

    before_action :configure_permitted_parameters, if: :devise_controller?

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
     end

end
