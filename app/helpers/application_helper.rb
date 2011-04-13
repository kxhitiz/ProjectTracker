module ApplicationHelper

  def is_owner(project)
    project.person_id == current_person.id
  end

  def is_authorized(story)
    story.person_id == current_person.id
  end
end

