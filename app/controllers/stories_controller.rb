class StoriesController < ApplicationController
  def index
  end

  def new
    @project = Project.find(params[:project_id])
    @story = @project.stories.new
  end

  def show
  end

  def create
    @project = Project.find(params[:project_id])
    @story = @project.stories.new(params[:story])

    if @story.save
      redirect_to project_path(@project), :notice => "Story Created Successfully"
    else
      render :action => "new", :alert => "Oops! Unable to create Story"
    end
  end

end
