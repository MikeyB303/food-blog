class BlogsController < ApplicationController
  def index
    @text = "Hello World!"
    @blogs = Blog.all
  end

  def new
  end

  def create
    authorize
    blog_details = {
      :title => params[:title],
      :body => params[:body],
      :user_id => current_user.id
    }
    new_blog = Blog.new(blog_details)
    if new_blog.save
      redirect_to '/'
    else
      @errors = new_blog.errors.full_messages
      render '/blogs/new'
    end
  end

  def show
    @blog = Blog.find_by id: params[:id]
  end

  def edit
    authorize
    @blog = Blog.find_by id: params[:id]
    if !author?(@blog)
      redirect_to "/blogs/#{@blog.id}"
    end
  end

  def update
    @blog = Blog.find_by id: params[:id]
    blog_details = {
      title: params[:blog]["title"],
      body: params[:blog]["body"],
    }
    @blog.update_attributes(blog_details)
    redirect_to "/blogs/#{@blog.id}"
  end

  def destroy
    @blog = Blog.find_by id: params[:id]
    @blog.destroy
    redirect_to '/'
  end
end