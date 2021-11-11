require_relative 'handlers'
require_relative 'storage'
require_relative 'add_details'

class App
  include Handlers
  include AddDetails

  def initialize
    @data = Storage.new
  end

  def run
    puts 'Welcome to the Catalog of things'
    @data.load_data

    loop do
      puts
      options

      option = gets.chomp
      break if option == '3'

      options_handler(option)
    end

    @data.save_data
    puts 'Thank you for using this app!'
  end

  def options
    puts 'Please choose an option by entering a number:'
    puts '1 - List items'
    puts '2 - Add items'
    puts '3 - Quit'
  end

  def list_items
    puts 'Please select an option by entering a number:'
    puts '1 - List books'
    puts '2 - List music albums'
    puts '3 - List games'
    puts '4 - List genres'
    puts '5 - List labels'
    puts '6 - List authors'
    puts '7 - List sources'
    option = gets.chomp

    list_items_handler(option)
  end

  def add_items
    puts 'Please select an option by entering a number:'
    puts '1 - Add a book'
    puts '2 - Add a music album'
    puts '3 - Add a game'
    option = gets.chomp

    add_items_handler(option)
  end
end
