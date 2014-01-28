class PostController < ApplicationController
  def create
  	details = new_post_params
  	#make sure a user isnt posting to a charity that isn't theirs
  	if current_user.charities.exists?(id: details[:charity_id])
  		details[:user_id] = current_user.id
  		@post = Post.new(details)
  		if @post.save
  			flash[:notice] = "Post created successfully"
  		else
  			flash[:alert] = "Error creating post"
  		end
  	else
  		flash[:alert] = "Error creating post"
  	end

  	redirect_to :back
  end

	private

	def new_post_params
		params.require(:post).permit(:title, :content, :charity_id)
	end 
end
