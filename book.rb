require_relative 'item'

class Book < Item
  def initialize(publish_date, publisher, cover_state)
    super(publish_date)
    @publisher = publisher
    @cover_state = cover_state
  end

  def can_be_archived?
    super || @cover_state == 'bad'
  end

  def to_s
    "[Book] Publisher: \"#{@publisher}\", Cover State: #{@cover_state}, #{super}"
  end

  def to_json(*args)
    super.merge({
                  JSON.create_id => self.class.name,
                  'publisher' => @publisher,
                  'cover_state' => @cover_state
                }).to_json(*args)
  end

  def self.json_create(object)
    book = new(Time.new(object['publish_date']), object['publisher'], object['cover_state'])
    book.id = object['id']
    book
  end
end