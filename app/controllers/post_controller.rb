class PostController < ApplicationController

  layout 'admin'
  before_filter :find_post, :only => [:edit, :update, :destroy]

  def show
    @post = @charity.posts.find(params[:post_id])
  end

  def create
		post = @charity.posts.new(new_post_params)
    post.author = current_user
		if post.save
			flash[:notice] = "Post created successfully"
		else
			flash[:error] = "Error creating post"
		end
  	redirect_to charity_path(@charity, :posts)
  end

  def edit
    
  end

  def update
    @post.update_attributes(new_post_params)
    @post.save
    redirect_to charity_path(@charity, :posts)
  end

  def destroy
    @post.delete
    redirect_to charity_path(@charity, :show)
  end

	private

  def find_post
     @post = @charity.posts.find(params[:post_id])
  end

	def new_post_params
		params.require(:post).permit(:title, :content)
	end
end
