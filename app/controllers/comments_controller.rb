class CommentsController < ApplicationController
 	def create
		flight = Flight.find(params[:flight_id])
		comment = current_user.comments.build(comment_params)
		comment.flight_id = flight.id
		comment.save
		redirect_to flight_path(flight.id)
	end

	def destroy
		flight = Flight.find(params[:flight_id])
		@comment = flight.comments.find(params[:id])
		@comment.destroy
		redirect_to flight_path(flight.id)
	end

private

	def comment_params
		params.require(:comment).permit(:content)
	end
end
