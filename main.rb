class Main

  def run
    puts 'Welcome to the Catalog of things'

    loop do
      puts
      options

      option = gets.chomp
      break if option == '7'
    end

    puts 'Thank you for using this app!'
  end

  def options
    puts 'Please choose an option by entering a number:'
    puts '1 - List items'
    puts '2 - List all genres'
    puts '3 - List all labels'
    puts '4 - List all authors'
    puts '5 - List all sources'
    puts '6 - Add item'
    puts '7 - Quit'
  end
end

Main.new.run