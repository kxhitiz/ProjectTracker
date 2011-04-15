class ApplicationController < ActionController::Base
  protect_from_forgery

  def is_owner(project)
    project.person_id == current_person.id
  end

  def find_people_in_this_project(project)
    @project_people = Array.new
    Connection.find(:all, :conditions => ["project_id = ?", project.id]).each do |connection|
      @project_people << Person.find(connection.person_id)
    end
  return @project_people
  end

  def send_assign_message(story,project, person)
    content_me = "You have assigned #{story.title} of project #{project.title} to #{person.name}"
    content_to_send = "Hello, you have been assigned to #{@story.title} of project #{@project.title} by #{current_person.name}"

    current_person.messages.create!(:content => content_me, :status => "unread", :project_id => project.id, :story_id => story.id)
    person.messages.create!(:content => content_to_send, :status => "unread", :project_id => project.id, :story_id => story.id)
  end

  def send_status_change_msg(project, story, status)
    content_me = "You have changed Status of #{story.title} of project #{project.title} to #{status}"
    content_to_send = "Status of #{story.title} of project #{project.title} changed to #{status} by #{current_person.name}"
    @to = Person.find(story.person_id)
    current_person.messages.create!(:content => content_me, :status => "unread", :project_id => project.id, :story_id => story.id)
    if is_owner(project)
      @to.messages.create!(:content => content_to_send, :status => "unread", :project_id => project.id, :story_id => story.id)
    else
      @to = Person.find(project.person_id)
      @to.messages.create!(:content => content_to_send, :status => "unread", :project_id => project.id, :story_id => story.id)
    end
  end

end

