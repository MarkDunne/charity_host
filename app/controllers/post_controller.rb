class PostController < ApplicationController

  layout 'admin'
  before_filter :find_post, :only => [:edit, :update, :destroy]

  def index
    @posts = Post.all
    if !params[:tag].blank?
      @posts = @posts.select{|p| p.has_tag params[:tag]} 
    end
  end

  def show
    @post = @charity.posts.find(params[:post_id])
  end

  def create
		post = @charity.posts.new(new_post_params)
    post.author = current_user
    post.save

    if post.save
      params[:post][:tags].delete(' ').split(',').each do |tag|
        post.post_tags.create(tag: tag)
      end
      flash[:notice] = "Post created successfully"
    else
      flash[:error] = "Error creating post"
    end
    redirect_to charity_path(@charity)
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
