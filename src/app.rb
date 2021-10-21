require_relative './modules/users'
require_relative './modules/library'

require_relative './classes/users/enrollment'
require_relative './classes/library/library'

class App
  include UsersMethods
  include LibraryMethods

  def initialize
    @options = [
      'List all books',
      'List all people',
      'Create a person',
      'Create a book',
      'Create a rental',
      'List all rentals for a given person id',
      'Exit'
    ]
    @library = Library.new
    @enrollment = Enrollment.new
    @run_app = false
  end

  def run
    @run_app = true
    select_option while @run_app
  end

  def exit!
    puts 'Thank you for using this app!'
    @run_app = false
  end

  private

  def select_option
    list_options
    selected_option = gets.chomp.to_i

    case selected_option
    when 1
      list_books
    when 2
      list_people
    when 3
      create_person
    when 4
      create_book
    when 5
      create_rental
    when 6
      list_rentals_for_user_id
    when 7
      exit!
    end
  end

  def list_options
    puts "\n"
    puts 'Please choose an option by enterin a number'
    @options.each_with_index { |option, index| puts "#{index + 1} - #{option}" }
    puts "\n"
  end
end
