require_relative 'item'
require_relative 'book'
require_relative 'label'
require_relative 'author'
require_relative 'source'

require 'json'

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

  def add_author(author)
    @authors.push(author)
  end

  def list_authors
    @authors.each { |author| puts author }
  end

  def add_label(label)
    @labels.push(label)
  end

  def list_labels
    @labels.each { |label| puts label }
  end

  def add_source(source)
    @sources.push(source)
  end

  def list_sources
    @sources.each { |source| puts source }
  end

  def save_data
    save_file(@genres, 'genres.json')
    save_file(@authors, 'authors.json')
    save_file(@labels, 'labels.json')
    save_file(@sources, 'sources.json')
    save_file(@books, 'books.json')
  end

  def save_file(data, file_name)
    File.write(file_name, JSON.generate(data)) if data.any?
  end
end
