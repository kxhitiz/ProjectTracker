module ProjectsHelper
  def connected_people(connections)
    @people = Array.new
    connections.each do |obj|
      @people.push(Person.find(obj.person_id))
    end
    @people
  end

  def calculate_status(project)

  end
end

