class MemesController < ApplicationController
  before_filter :id_required!, only: [:index]

  def index
    @memes = Meme.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @memes }
    end
  end

  def id_required!
    unless params[:api_id]
      message = "you need an api_id"
      render json: { error: message}, status: 401
    end
  end
  private :id_required!

  def show
    @meme = Meme.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @meme }
    end
  end

  def new
    @meme = Meme.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @meme }
    end
  end

  def edit
    @meme = Meme.find(params[:id])
  end

  def create
    @meme = Meme.new(params[:meme])

    respond_to do |format|
      if @meme.save
        format.html { redirect_to @meme, notice: 'Meme was successfully created.' }
        format.json { render json: @meme, status: :created, location: @meme }
      else
        format.html { render action: "new" }
        format.json { render json: @meme.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @meme = Meme.find(params[:id])

    respond_to do |format|
      if @meme.update_attributes(params[:meme])
        format.html { redirect_to @meme, notice: 'Meme was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @meme.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @meme = Meme.find(params[:id])
    @meme.destroy

    respond_to do |format|
      format.html { redirect_to memes_url }
      format.json { head :no_content }
    end
  end
end
