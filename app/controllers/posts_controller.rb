class PostsController < ApplicationController
	before_action :correct_user, only: [:edit, :update]

	def new
		@post = Post.new
		@genres = Genre.all
	end

	def create
		@post = Post.new(post_params)
		@post.user_id = current_user.id
		if @post.save
			redirect_to posts_path
		else 
			render :new
		end
	end

	def index

		@genres  = Genre.all
      p params[:i].class
      if params[:i]
        posts = Post.where(genre_id: params[:i])
        @posts = posts.page(params[:page]).per(10)
      else
        @posts = Post.page(params[:page]).per(10)
      end
	end

	def show
		@post = Post.find(params[:id])
		@comment = Comment.new
	end

	def edit
		@post = Post.find(params[:id])
		@genres = Genre.all
	end

	def update
		post = Post.find(params[:id])
		post.update(post_params)
		redirect_to post_path(post.id)
	end

	def destroy
		@post = Post.find(params[:id])
		@post.destroy
		redirect_to posts_path
	end

	private
	def correct_user
    post = Post.find(params[:id])
    user = post.user_id
    unless user == current_user.id
      redirect_to posts_path
    end
    end

	def post_params
		params.require(:post).permit(:title, :text, :image, :genre_id, :user_id)
	end

end
