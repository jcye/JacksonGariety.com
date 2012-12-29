class HomeController < ApplicationController
  def index
    @posts = Post.all
    @events = Event.all
    @contents = @posts.zip(@events).flatten.compact
    @contents = @contents.sort_by &:created_at
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @contents }
    end
  end
end