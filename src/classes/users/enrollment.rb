class Enrollment
  attr_reader :people

  def initialize
    @people = []
  end

  def add_person(person)
    @people.push(person) unless @people.include?(person)
    person.enrollment = self
  end
end
