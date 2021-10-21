class Library
  attr_reader :books

  def initialize
    @books = []
  end

  def add_book(book)
    @books.push(book) unless @books.include?(book)
    book.library = self
  end
end
