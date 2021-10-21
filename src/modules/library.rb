require_relative '../classes/library/book'
require_relative '../classes/library/rental'

module LibraryMethods
  def list_books
    puts 'Books:'
    @library.books.each_with_index do |book, index|
      yield(index) if block_given?
      puts "Title: #{book.title}, Author: #{book.author}"
    end
  end

  def create_book
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp

    book = Book.new(title, author)
    @library.add_book(book)

    puts 'Book created successfully'

    book
  end

  def create_rental
    selected_book = select_book

    puts "\n"
    selected_person = select_person

    puts "\n"
    print 'Date: '
    date = gets.chomp

    # Create Rental
    rental = Rental.new(date, selected_person, selected_book)
    puts 'Rental created successfully'

    rental
  rescue StandardError => e
    puts e.message
  end

  def list_rentals_for_user_id
    print 'ID of person: '
    person_id = gets.chomp.to_i

    puts 'Rentals:'
    selected_person = @enrollment.people.find { |person| person.id == person_id }

    unless selected_person
      puts "Not existing person with ID #{person_id}"
      return nil
    end

    selected_person.rentals.each do |rental|
      puts "Date: #{rental.date}, Book \"#{rental.book.title}\" by #{rental.book.author}"
    end
  end

  private

  def select_book
    puts 'Select a book from the following list by number'
    list_books { |index| print "#{index}) " }
    book_index = gets.chomp.to_i
    selected_book = @library.books[book_index]

    throw "Not existing book #{book_index}" unless selected_book

    selected_book
  end

  def select_person
    puts 'Select a person from the following list by number (not id)'
    list_people { |index| print "#{index}) " }
    person_index = gets.chomp.to_i
    selected_person = @enrollment.people[person_index]

    throw "Not existing person #{person_index}" unless selected_person

    selected_person
  end
end
