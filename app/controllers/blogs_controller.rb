class BlogsController < ApplicationController

  def show
    @blog = Blog.find(params[:id])
  end
  # Top画面にあたる
  def index
    @blogs = Blog.all
    p "標準出力にのみ反映"
    logger.debug("標準出力とログファイルに記録される")
  end

# ブログの新規投稿
  def new
    @blog = Blog.new
  end

  def create
    @blog =Blog.new(blog_params)
    if @blog.save
      # Top画面遷移から詳細画面遷移に変更済み
      redirect_to blog_path(@blog)
    else
      render :new
    end
  end

  def edit
    @blog = Blog.find(params[:id])
  end

  def update
    blog = Blog.find(params[:id])
    blog.update(blog_params)
    redirect_to blog_path(blog)
  end

  def destroy
    blog = Blog.find(params[:id])
    blog.destroy
    redirect_to blogs_path
  end

  # form_withを使う際はStorong Parametersの定義が必要
  # Storong Parametersの定義
  private
  def blog_params
    params.require(:blog).permit(:title, :category, :body)
  end
end
