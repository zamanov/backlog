class StoriesController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource
  before_action :set_story, only: [:show, :edit, :update, :destroy, :share]

  # GET /stories
  # GET /stories.json
  def index
    @stories = Story.all
  end

  # GET /stories/1
  # GET /stories/1.json
  def show
  end

  # GET /stories/new
  def new
    @story = Story.new
  end

  # GET /stories/1/edit
  def edit
  end

  #GET /stories/1/split
  def split
    @hash = []
    2.times do
      @hash << Story.new
    end
  end

  # POST /stories
  def create
    @story = Story.new(story_params)
    if @story.save
      redirect_to @story, notice: 'Story was successfully created.'
    else
      render :new
    end
  end

  # POST /stories/1/split
  def share
    isFull = true
    params["stories_hash"].each do |story|
      if Story.new(story_hash_params(story)).invalid?
        isFull = false
      end
    end
    if isFull
      params["stories_hash"].each do |story|
        Story.create(story_hash_params(story))
      end
      @story.destroy
      redirect_to '/stories'
    else
      redirect_to '/stories', notice: 'Bad data.'
    end
  end

  # PATCH/PUT /stories/1
  def update
    if @story.update(story_params)
      redirect_to @story, notice: 'Story was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /stories/1
  def destroy
    @story.destroy
    redirect_to stories_url, notice: 'Story was successfully destroyed.'
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_story
    @story = Story.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def story_params
    params.require(:story).permit(:name, :rank, :points, :title, :notes)
  end

  def story_hash_params(params)
    params.permit(:name, :rank, :points, :title, :notes)
  end

end
