module StoriesHelper
  def getName(id)
    Person.find(id).name
  end
end

