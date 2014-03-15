class CommentController < RedirectController
	
	layout 'admin'
	before_filter :find_comment, :only => [:show, :destroy]

	def show
		
	end

	def destroy
		@comment.delete
		redirect_to post_path(@charity, @comment.post, :edit)
	end

	private

	def find_comment
		@comment = @charity.posts.find(params[:post_id]).comments.find(params[:comment_id])
	end
end
