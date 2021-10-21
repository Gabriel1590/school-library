require_relative '../classes/users/student'
require_relative '../classes/users/teacher'

module UsersMethods
  def list_people
    puts 'People:'
    @enrollment.people.each_with_index do |person, index|
      yield(index) if block_given?
      puts "[#{person.class.name}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
  end

  def create_person
    print 'Do you want to create a student (1) or a teacher (2) [Input the number]: '
    option_number = gets.chomp.to_i

    person = nil

    case option_number
    when 1
      person = create_student
    when 2
      person = create_teacher
    else
      puts "Not existing type of person #{option_number}"
      return nil
    end

    @enrollment.add_person(person)
    puts 'Person created successfully'

    person
  end

  private

  def create_student
    print 'Age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp
    print 'Has parent permission? [Y/N]: '
    parent_permission = gets.chomp == 'Y'

    Student.new(age, name, parent_permission)
  end

  def create_teacher
    print 'Age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp
    print 'Specialization: '
    specialization = gets.chomp

    Teacher.new(specialization, age, name)
  end
end
