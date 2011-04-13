class StoriesController < ApplicationController
  def index
  end

  def new
    @project = Project.find(params[:project_id])
    @story = @project.stories.new
  end

  def show
    @story = Story.find(params[:id])
    @project = Project.find(params[:project_id])
    @people = find_people_in_this_project(@project)
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
    @story = Story.find(params[:story_id])
    @project = Project.find(params[:project_id])
    @person = Person.find(params[:people])
    @story.update_attributes(:person_id => @person.id)
    redirect_to project_story_path(@project, @story)
  end

end

