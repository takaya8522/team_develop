class BlogsController < ApplicationController

  def index
    @blogs = Blog.all
  end

  def new
    @blog = Blog.new
  end

  def create
    @blog = Blog.new(params_valid)
    @blog.user_id = current_user.id
    if @blog.save
      redirect_to blogs_path, notice: "blog was successfully created." 
    else
      render :new
    end
  end

  def confirm
    @blog = Blog.new(params_valid)
  end

  def show
    @blog = Blog.find(params[:id])
  end

  def edit
    @blog = Blog.find(params[:id])
  end

  def update
    blog = Blog.find(params[:id]) 
    if @blog.update(params_valid)  
      redirect_to blogs_path
    else
      render :edit
    end
  end

  def destroy
    @blog = Blog.find(params[:id])
    @blog.destroy
    redirect_to blogs_path
  end

  private
  
  def params_valid
    params.repuire(:blog).permit(:title, :content, :user_id)
  end
  
end
