class BlogsController < ApplicationController
  
  def show
    
  end
  # Top画面にあたる
  def index
    @blogs = Blog.all
  end

# ブログの新規投稿
  def new
    @blog = Blog.new
  end

  def create
    blog =Blog.new(blog_params)
    blog.save
    redirect_to blogs_path
  end

  def edit
  end

  # form_withを使う際はStorong Parametersの定義が必要
  # Storong Parametersの定義
  private
  def blog_params
    params.require(:blog).permit(:title, :category, :body)
  end
end
