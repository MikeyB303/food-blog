class BlogsController < ApplicationController
  def index
    @text = "Hello World!"
    @blogs = Blog.all
  end

  def new
  end

  def create
    
    redirect_to '/'
  end
end