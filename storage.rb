require_relative 'item'
require_relative 'book'

class Storage
  attr_reader :books, :genres, :authors, :labels, :sources
  def initialize
    @books = []
    @genres = []
    @authors = []
    @labels = []
    @sources = []
  end

  def add_book(book)
    @books.push(book)
  end

  def list_books
    @books.each { |book| puts book }
  end

  def add_genre(genre)
    @genres.push(genre)
  end

  def list_genres
    @genres.each { |genre| puts genre }
  end
end
