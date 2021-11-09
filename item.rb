class Item
  attr_reader :genre, :author, :game, :label, :archived
  attr_accessor :id

  def initialize(publish_date)
    @id = Random.rand(1000..10_000)
    @publish_date = publish_date
    @archived = false
  end

  def add_genre(genre)
  end

  def add_author()
  end

  def add_label()
  end

  def add_game()
  end

  def move_to_archive
    @archived = can_be_archived?
  end

  private

  def can_be_archived?
    (Time.now.year - @publish_date.year) > 10
  end
end
