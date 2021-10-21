require_relative '../correctors/corrector'

class Person
  attr_accessor :name, :age
  attr_reader :id, :rentals, :enrollment

  def initialize(age, name = 'Unknown', parent_permission = true)
    @id = rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @corrector = Corrector.new
    @rentals = []
  end

  def can_use_services?
    is_of_age? || @parent_permission
  end

  def validate_name
    @name = @corrector.correct_name(@name)
  end

  def add_rental(rental)
    @rentals.push(rental) unless rentals.include?(rental)
    rental.person = self
  end

  def enrollment=(enrollment)
    enrollment.people.push(self) unless enrollment.people.include?(self)
    @enrollment = enrollment
  end

  private

  def is_of_age?
    @age >= 18
  end
end
