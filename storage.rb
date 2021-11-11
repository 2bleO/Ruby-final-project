require_relative 'item'
require_relative 'book'
require_relative 'label'
require_relative 'author'
require_relative 'source'
require 'json'

class Storage
  attr_reader :books, :genres, :authors, :labels, :sources, :albums, :games
  def initialize
    @books = []
    @albums = []
    @games = []
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

  def add_album(album)
    @albums.push(album)
  end

  def list_albums
    @albums.each { |album| puts album }
  end

  def add_game(game)
    @games.push(game)
  end

  def list_games
    @games.each { |game| puts game }
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
    save_file(@albums, 'albums.json')
    save_file(@games, 'games.json')
  end

  def save_file(data, file_name)
    File.write(file_name, JSON.generate(data)) if data.any?
  end

  def load_data
    @books = load_file('books.json')
    @albums = load_file('albums.json')

    @genres = load_file('genres.json')
    @authors = load_file('authors.json')
    @labels = load_file('labels.json')
    @sources = load_file('sources.json')

    load_relationships(@books, 'books.json')
    load_relationships(@albums, 'albums.json')
  end

  def load_file(file)
    if File.exist? file
      JSON.parse(File.read(file), create_additions: true)
    else
      []
    end
  end

  def load_relationships(items, file_name)
    return unless File.exist?(file_name)

    items_json = JSON.parse(File.read(file_name))

    items_json.each_with_index do |item_json, index|
      genre = @genres.detect { |genre_json| genre_json.id == item_json['genre_id'] }
      author = @authors.detect { |author_json| author_json.id == item_json['author_id'] }
      label = @labels.detect { |label_json| label_json.id == item_json['label_id'] }
      source = @sources.detect { |source_json| source_json.id == item_json['source_id'] }

      item = items[index]
      item.add_genre(genre)
      item.add_author(author)
      item.add_label(label)
      item.add_source(source)
    end
  end
end
