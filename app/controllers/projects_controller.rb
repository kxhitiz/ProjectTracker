class ProjectsController < ApplicationController

  before_filter :authenticate_person!
  def index
    @projects = Project.all
  end

  def show
    @project = Project.find(params[:id])
    @stories = @project.stories
  end

  def create
    @project = Project.new(params[:project])
    @project.person_id = current_person.id
    @project.points = 0
    if @project.save
      redirect_to projects_path, :notice => "Project Added Successfully"
    else
      render :action => "new", :alert => "Project Add Failed!!"
    end
  end

  def new
    @project = Project.new
  end

  def edit
  end

end

