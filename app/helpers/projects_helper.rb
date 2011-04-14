module ProjectsHelper
  def connected_people(connections)
    @people = Array.new
    connections.each do |obj|
      @people.push(Person.find(obj.person_id))
    end
    @people
  end

  def calculate_points(project)
    points = 0
    project.stories.each do |story|
      story.status == "Accepted" ? points += story.weight : points += 0
    end
    return points
  end

end

