class PostsController < ApplicationController
	def create
		Post.create post_params
		redirect_to '/events'
	end

	def destroy
		@post = Post.where(event: params[:id], user: current_user).first
    @post.destroy 
    redirect_to "/events" 
	end

	private
	 def post_params
	 	params.require(:post).permit(:event_id).merge(user: current_user)
	 end
end






















































