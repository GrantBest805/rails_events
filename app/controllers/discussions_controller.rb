class DiscussionsController < ApplicationController
	def create
		@discussion = Discussion.new(dis_params)
		if @discussion.save
			redirect_to :back
		else
			flash[:errors] = @discussion.errors.full_messages
			redirect_to :back
		end
	end

	private
		def dis_params
			params.require(:discussion).permit(:content,:event_id).merge(user: current_user)
		end
end
