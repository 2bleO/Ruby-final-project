module AddDetails
  def add_item_details(item)
    add_genre(item)
    add_author(item)
    add_source(item)
    add_label(item)
  end

  def add_genre(item)
    puts 'Select a genre from the following list or "n" to add new genre: '
    @data.genres.each_with_index { |genre, idx| puts "#{idx} - #{genre}" }
    option = gets.chomp.downcase
    genre = nil

    if option == 'n'
      print 'Genre name: '
      genre = Genre.new(gets.chomp)
      @data.add_genre(genre)
    else
      genre = @data.genres[option.to_i]
    end
    item.add_genre(genre)
  end

  def add_author(item)
    puts 'Select an author from the following list or "n" to add a new author: '
    @data.authors.each_with_index { |author, idx| puts "#{idx} - #{author}" }
    option = gets.chomp.downcase
    author = nil

    if option == 'n'
      print 'Author first name: '
      first_name = gets.chomp

      print 'Author last name: '
      last_name = gets.chomp

      author = Author.new(first_name, last_name)
      @data.add_author(author)
    else
      author = @data.authors[option.to_i]
    end
    item.add_author(author)
  end

  def add_source(item)
    puts 'Select a source from the following list or "n" to add a new source: '
    @data.sources.each_with_index { |source, idx| puts "#{idx} - #{source}" }
    option = gets.chomp.downcase
    source = nil

    if option == 'n'
      print 'Source: '
      source = Source.new(gets.chomp)
      @data.add_source(source)
    else
      source = @data.sources[option.to_i]
    end
    item.add_source(source)
  end

  def add_label(item)
    puts 'Select a label from the following list or "n" to add a new label: '
    @data.labels.each_with_index { |label, idx| puts "#{idx} - #{label} #{label.color}" }
    option = gets.chomp.downcase
    label = nil

    if option == 'n'
      print 'Label title: '
      title = gets.chomp

      print 'Label color: '
      color = gets.chomp

      label = Label.new(title, color)
      @data.add_label(label)
    else
      label = @data.labels[option.to_i]
    end
    item.add_label(label)
  end
end
