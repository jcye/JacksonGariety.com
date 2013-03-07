class HomeController < ApplicationController
  def index
    @contents = (Event.all + Photograph.all + Post.all + Project.all + Quote.all + Video.all).sort_by(&:created_at).reverse

    @featured = @contents.detect { |r| [Post, Project, Video].include? r.class }

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @contents }
    end
  end
end