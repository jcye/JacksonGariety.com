class PostsController < ApplicationController
  # GET /posts
  # GET /posts.json
  def index
    @title = "Jackson Gariety - The Literary"

    @posts = Post.all

    @updated = @posts.first.updated_at unless @posts.empty?

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @posts }
      format.atom { render :layout => false } # index.atom.builder
      format.rss { redirect_to feed_path(:format => :atom), :status => :moved_permanently }
    end
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @post = Post.find_by_slug(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @post }
    end
  end

  # GET /posts/new
  # GET /posts/new.json
  def new
    @post = Post.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @post }
    end
  end

  # GET /posts/1/edit
  def edit
    @post = Post.find_by_slug(params[:id])
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(params[:post])

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render json: @post, status: :created, location: @post }
      else
        format.html { render action: "new" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /posts/1
  # PUT /posts/1.json
  def update
    @post = Post.find_by_slug(params[:id])

    respond_to do |format|
      if @post.update_attributes(params[:post])
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post = Post.find_by_slug(params[:id])
    @post.destroy

    respond_to do |format|
      format.html { redirect_to posts_url }
      format.json { head :no_content }
    end
  end

  def like
    render :nothing => true

    id = params[:post_id]
    cookies.permanent[:like_history] = "" unless cookies[:like_history]

    unless cookies[:like_history].split(",").include? id.to_s

      cookies.permanent[:like_history] = cookies[:like_history] + ",#{id}"

      @post = Post.find(id)

      @post.update_column(:likes, @post.likes + 1)
    end
  end
end
