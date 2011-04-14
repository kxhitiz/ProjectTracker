class ApplicationController < ActionController::Base
  protect_from_forgery


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

end

