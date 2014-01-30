class PostController < ApplicationController
  
  def new
    
  end

  def create
		post = @charity.posts.new(post_params)
    post.user = current_user
		if post.save
			flash[:notice] = "Post created successfully"
		else
			flash[:alert] = "Error creating post"
		end
  	redirect_to charity_path(@charity, :posts)
  end


  def edit
    @post = @charity.posts.find(params[:post_id])
  end

  def update
    @post = @charity.posts.find(params[:post_id])
    @post.update_attributes(post_params)
    @post.save
    redirect_to charity_path(@charity, :posts)
  end

	private

	def post_params
		params.require(:post).permit(:title, :content)
	end
end
