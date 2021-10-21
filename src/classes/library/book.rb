class Book
  attr_accessor :title, :author
  attr_reader :rentals, :library

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  def library=(library)
    library.books.push(self) unless library.books.include?(self)
    @library = library
  end

  def add_rental(rental)
    @rentals.push(rental) unless rentals.include?(rental)
    rental.book = self
  end
end
