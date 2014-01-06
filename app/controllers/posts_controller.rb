class PostsController < ApplicationController
  before_action :ensure_permission, only: [:new, :create, :edit, :update, :destroy ]
  def new
    @title = "Новый пост"
  	@post = Post.new
  end

	def create
	  @post = Post.new(post_params)	 
	  if @post.save
    	redirect_to @post
  	else
    	render 'new'
  	end
	end

	def show
		@post = Post.find(params[:id])
	end

	def index
		@posts = Post.all
	end

	def edit
  	@post = Post.find(params[:id])
	end

	def update
    @post = Post.find(params[:id]) 
    if @post.update(post_params)
      redirect_to @post
    else
      render 'edit'
    end
  end

  def destroy
  	@post = Post.find(params[:id])
  	@post.destroy 
  	redirect_to posts_path
	end
 
  private

  def post_params
    params.require(:post).permit(:title, :text, :user_id)
  end

  def ensure_permission
    unless login?
      render :file => 'public/403.html', :status => :forbidden, :layout => false
    end
  end

end
