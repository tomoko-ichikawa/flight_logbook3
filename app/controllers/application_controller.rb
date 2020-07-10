class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception

	before_action :authenticate_user!
	before_action :configure_permitted_parameters, if: :devise_controller?
	before_action :set_copyright

	def set_copyright
		@copyright = FlightLogbookTool::Rendere.copyright 'Tomoko', 'All rights reserved'
	end

	protected

	def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :profile, :icon])
		devise_parameter_sanitizer.permit(:account_update, keys: [:name, :profile, :icon])
	end

	def after_sign_in_path_for(resource)
		flights_path
	end

	def after_sign_out_path_for(resource)
		new_user_session_path
	end
end

module FlightLogbookTool
	class Rendere
		def self.copyright name, msg
			"&copy #{Time.now.year} | <b>#{name}</b> #{msg}".html_safe
		end
	end
end