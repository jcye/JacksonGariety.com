class HomeController < ApplicationController
  def index
    @title = "Jackson Gariety - The Stalker"

    @contents = (Event.all + Photograph.all + Post.all + Project.all + Quote.all + Video.all).sort_by(&:created_at).reverse

    @featured = @contents.detect { |r| [Post, Project, Video].include? r.class }

    @updated = @contents.first.updated_at unless @contents.empty?

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @contents }
      format.atom { render :layout => false } # index.atom.builder
      format.rss { redirect_to feed_path(:format => :atom), :status => :moved_permanently }
    end
  end

  def architect
    @title = "Jackson Gariety - The Architect"

    @contents = (Photograph.all + Post.all + Project.all + Quote.all + Video.all).sort_by(&:created_at).reverse

    @updated = @contents.first.updated_at unless @contents.empty?

    respond_to do |format|
      format.atom { render :layout => false }  #architect.atom.builder
      format.rss { redirect_to feed_path(:format => :atom), :status => :moved_permanently }
    end
  end
end