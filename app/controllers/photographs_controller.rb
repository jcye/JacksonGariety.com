class PhotographsController < ApplicationController
  # GET /Photographs
  # GET /Photographs.json
  def index
    @photograph = Photograph.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @photograph }
    end
  end

  # GET /Photographs/1
  # GET /Photographs/1.json
  def show
    @photograph = Photograph.find_by_slug(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @photograph }
    end
  end

  # GET /Photographs/new
  # GET /Photographs/new.json
  def new
    @photographs = Photograph.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @photographs }
    end
  end

  # GET /Photographs/1/edit
  def edit
    @photograph = Photograph.find_by_slug(params[:id])
  end

  # POST /Photographs
  # POST /Photographs.json
  def create
    @photograph = Photograph.new(params[:Photograph])

    respond_to do |format|
      if @photograph.save
        format.html { redirect_to @photograph, notice: 'Photograph was successfully created.' }
        format.json { render json: @photograph, status: :created, location: @photograph }
      else
        format.html { render action: "new" }
        format.json { render json: @photograph.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /Photographs/1
  # PUT /Photographs/1.json
  def update
    @photograph = Photograph.find_by_slug(params[:id])

    respond_to do |format|
      if @photograph.update_attributes(params[:Photograph])
        format.html { redirect_to @photograph, notice: 'Photograph was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @photograph.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /Photographs/1
  # DELETE /Photographs/1.json
  def destroy
    @photograph = Photograph.find_by_slug(params[:id])
    @photograph.destroy

    respond_to do |format|
      format.html { redirect_to Photographs_url }
      format.json { head :no_content }
    end
  end
end
