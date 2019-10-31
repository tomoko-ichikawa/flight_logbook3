module FlightsHelper
	def choose_new_or_edit
		if action_name == 'new' || action_name == 'confirm'
			confirm_flights_path
		elsif action_name == 'edit'
			flight_path
		end
	end
end
