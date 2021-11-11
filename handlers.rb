require_relative 'book'
require_relative 'label'
require_relative 'author'
require_relative 'genre'
require_relative 'source'

module Handlers
  def options_handler(option)
    case option
    when '1'
      list_items
    when '2'
      add_items
    else
      puts 'invalid valid option'
    end
  end

  def list_items_handler(option)
    case option
    when '1'
      @data.list_books
    when '2'
      @data.list_music_albums
    when '3'
      @data.list_games
    when '4'
      @data.list_genres
    when '5'
      @data.list_labels
    when '6'
      @data.list_authors
    when '7'
      @data.list_sources
    else
      puts 'invalid valid option'
    end
  end

  def add_items_handler(option)
    case option
    when '1'
      add_book
    when '2'
      add_music_album
    when '3'
      add_game
    else
      puts 'invalid valid option'
    end
  end

  def add_book
    print 'Publish date? (Year): '
    publish_date = Time.new(gets.chomp)

    print 'Publisher: '
    publisher = gets.chomp

    print 'Is cover in good shape? [y/n]: '
    cover_state = gets.chomp.downcase == 'y' ? 'good' : 'bad'

    book = Book.new(publish_date, publisher, cover_state)
    add_item_details(book)
    @data.add_book(book)
    print 'Book added correctly'
    puts
  end
end
