class StoriesController < ApplicationController
  def index
  end

  def new
    @project = Project.find(params[:project_id])
    @story = @project.stories.new
  end

  def show
    @story = Story.find(params[:id])

  end

  def create
    @project = Project.find(params[:project_id])
    @story = @project.stories.new(params[:story])
    @story.status = "Not Yet Started"
    if @story.save
      redirect_to project_path(@project), :notice => "Story Created Successfully"
    else
      render :action => "new", :alert => "Oops! Unable to create Story"
    end
  end

  def assign
  end

  def release

  end

end

