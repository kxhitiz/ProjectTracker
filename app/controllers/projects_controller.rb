class ProjectsController < ApplicationController

  before_filter :authenticate_person!
  def index
    @projects = Project.all
  end

  def show
    @project = Project.find(params[:id])
    @stories = @project.stories
    @owner = Person.find(@project.person_id)
    @collaborators = Connection.find(:all, :conditions => ['project_id = ?', params[:id] ])
    @people = Person.all
  end

  def create
    @project = Project.new(params[:project])
    @project.person_id = current_person.id # no need
    @project.points = 0
    if @project.save
      Connection.create(:project_id => @project.id, :person_id => current_person.id, :types => "owner")
      redirect_to projects_path, :notice => "Project Added Successfully"
    else
      render :action => "new", :alert => "Project Add Failed!!"
    end
  end

  def new
    @project = Project.new
  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])
    if @project.update_attributes(params[:project])
     redirect_to(projects_path, :notice => "Project Updated Successfully")
    else
      render :action => "edit", :alert => "Project Update Failure!!"
    end
  end

  def destroy
    @project = Project.find(params[:id])
     if @project.destroy
       redirect_to projects_path, :notice => "Project Deleted Successfully"
    else
       redirect_to projects_path, :alert => "Project Deletion Failed!!"
    end
  end

end

