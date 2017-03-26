class BlogsController < ApplicationController
  def index
    @text = "Hello World!"
    @blogs = Blog.all
  end

  def new
  end

  def create
    blog_details = {
      :title => params[:title],
      :body => params[:body],
      :user_id => current_user.id
    }
    new_blog = Blog.create(blog_details)
    if new_blog.save
      redirect_to '/'
    else
      redirect_to '/blogs/new'
    end
  end

  def show
    @blog = Blog.find_by id: params[:id]
  end
end