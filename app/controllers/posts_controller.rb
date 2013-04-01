class PostsController < ApplicationController
  http_basic_authenticate_with :name =>"dhh", 
                                 :password => "secret",
                                 :except => [:index, :show]
  def index
  	@posts = Post.all
  	@post = @posts.find params[:post]
  end

  def new
	@post = Post.new  
  end

  def create
  	@post = Post.new params[:post]
  	if @post.save
  		redirect_to posts_path
	else
		flash.now[:error] = "Cannot leave blank fields"
		render :new 
  	end
  end

  def show
  	@post = Post.find params[:id]
  end

  def edit
  	@post = Post.find params[:id]
  end

  def update
  	@post = Post.find params[:id]
  		if @post.update_attributes(params[:post])
  			redirect_to post_path@post.id
  		else
  			flash.now[:error] = "Cannot leave blank fields"
			render :new 
		end
  end

  def destroy
    @post = Post.find params[:id]
    @post.destroy
    redirect_to posts_url
  end


end
