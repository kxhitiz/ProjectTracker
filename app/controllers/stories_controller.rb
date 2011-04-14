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

   def edit
    @project = Project.find(params[:project_id])
    @story = Story.find(params[:id])
  end

  def update
    @project = Project.find(params[:project_id])
    @story = Story.find(params[:id])
    if @story.update_attributes(params[:story])
     redirect_to(project_path(@project), :notice => "Story Updated Successfully")
    else
      render :action => "edit", :alert => "Story Update Failure!!"
    end
  end

  def create
    @project = Project.find(params[:project_id])
    @story = @project.stories.new(params[:story])
    @story.setDefaults
    #@story.person_id = current_person.id
    if @story.save
      redirect_to project_path(@project), :notice => "Story Created Successfully"
    else
      render :action => "new", :alert => "Oops! Unable to create Story"
    end
  end

  def destroy
    @project = Project.find(params[:project_id])
    @story = Story.find(params[:id])
    #Connection.where("project_id = ?", @project.id).delete_all
    if @story.destroy
       redirect_to project_path(@project), :notice => "Story Deleted Successfully"
    else
       redirect_to project_path(@project), :alert => "Story Deletion Failed!!"
    end
  end

  def assign
    @story = Story.find(params[:story_id])
    @project = Project.find(params[:project_id])
    @person = Person.find(params[:people])
    @story.update_attributes(:person_id => @person.id)
    send_assign_message(@story, @project, @person)
    redirect_to project_story_path(@project, @story)
  end

  def change_status
    @story = Story.find(params[:story_id])
    @project = Project.find(params[:project_id])
    @story.update_attributes(:status => params[:status])
    content_me = "You have changed Status of #{@story.title} of project #{@project.title} to #{params[:status]}"
    content_to_send = "Status of #{@story.title} of project #{@project.title} changed to #{params[:status]} by #{current_person.name}"
    @to = Person.find(@story.person_id)
    current_person.messages.create!(:content => content_me, :status => "unread", :project_id => @project.id, :story_id => @story.id)
    @to.messages.create!(:content => content_to_send, :status => "unread", :project_id => @project.id, :story_id => @story.id)
    redirect_to project_story_path(@project,@story)
  end

end

