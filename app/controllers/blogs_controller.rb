class BlogsController < ApplicationController

  def index
    @blogs = Blog.includes(:user).order("created_at DESC").page(params[:page]).per(20)
  end

  def new
    @blog = Blog.new
  end

  def create
    Blog.create(title: blog_params[:title],text: blog_params[:text], image: blog_params[:image], size: blog_params[:size], user_id: current_user.id)
  end

  def destroy
    blog = Blog.find(params[:id])
    blog.destroy if blog.user_id == current_user.id
  end

  def edit
    @blog = Blog.find(params[:id])
  end

  def update
    blog = Blog.find(params[:id])
    blog.update(title: params[:title],text: params[:text], image: params[:image], size: params[:size], user_id: current_user.id) if blog.user_id == current_user.id
  end

  private
    def blog_params
      params.require(:blog).permit(:title, :text, :image, :size).merge(user_id: current_user.id)

    end


end
