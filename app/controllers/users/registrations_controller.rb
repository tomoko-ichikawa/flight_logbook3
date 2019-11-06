# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  protected

    def after_update_path_for(resource)
      user_path(id: current_user.id)
    end

    def configure_account_update_params
    	devise_parameter_sanitizer.permit(:account_update, keys:[:name, :icon, :icon_cache, :remove_icon])
    end
end
