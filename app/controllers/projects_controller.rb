class ProjectsController < ApplicationController

  before_filter :authenticate_person!

  def index
    #@projects = Project.all
    @projects = current_person_project
  end

  def show
    @all_people = Person.all
    @project = Project.find(params[:id])
    @stories = @project.stories
    @owner = Person.find(@project.person_id)
    @collaborators = Connection.find(:all, :conditions => ['project_id = ?', params[:id] ])
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
     Connection.where("project_id = ?", @project.id).delete_all
     if @project.destroy
       redirect_to projects_path, :notice => "Project Deleted Successfully"
    else
       redirect_to projects_path, :alert => "Project Deletion Failed!!"
    end
  end

  def addCollaborator
    @project = Project.find(params[:project_id])
    @person = Person.find(params[:people])
    if Connection.find_or_create_by_person_id_and_project_id(:person_id => @person.id, :project_id => @project.id, :types => "collaborator")
      redirect_to project_path(@project), :notice => " #{@person.name} is now added to #{@project.title}"
    else
      redirect_to project_path(@project), :notice => " Unable to add #{@person.name} to #{@project.title}"
    end
  end

  def removeCollaborator
    @project = Project.find(params[:project_id])
    @person = Person.find(params[:person_id])
    if Connection.delete_all(:project_id => @project.id, :person_id => @person.id)
      redirect_to project_path(@project), :alert => " #{@person.name} is now removed from #{@project.title}"
    else
      redirect_to project_path(@project), :alert => " Unable to remove #{@person.name} from #{@project.title}"
    end
  end

  def current_person_project
    project = []
    Connection.find(:all, :conditions => [ "person_id = ? ", current_person.id ]).each do |connection|
      project << Project.find(connection.project_id)
    end
    return project
  end
end

