class ApplicationController < ActionController::Base
  protect_from_forgery


  def find_people_in_this_project(project)
    @project_people = Array.new
    Connection.find(:all, :conditions => ["project_id = ?", project.id]).each do |connection|
      @project_people << Person.find(connection.person_id)
    end
  return @project_people
  end

end

