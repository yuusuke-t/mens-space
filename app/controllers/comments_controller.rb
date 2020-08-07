class CommentsController < ApplicationController

	def create
		@post = Post.find(params[:post_id])
		@comment = Comment.new(comment_params)
		@comment.user_id = current_user.id
		@comment.post_id = @post.id
		if @comment.save
			redirect_to post_path(@post.id)
		else
			@user = @post.user_id
			render 'books/show'
		end
	end

	def destroy
		@post = Post.find(params[:id])
		@comment = @post.comments.find(params[:post_id])
		@comment.destroy
		redirect_to post_path(@post.id)
	end

	private
	def comment_params
		params.require(:comment).permit(:comment)
	end
end
