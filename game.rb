require_relative 'item'

class Game < Item
  def initialize(publish_date, last_played_at, multiplayer)
    super(publish_date)
    @multiplayer = multiplayer
    @last_played_at = last_played_at
  end

  def to_s
    "[Game] Multiplayer: #{@multiplayer}, Last played at: #{@last_played_at}, #{super}"
  end

  def to_json(*args)
    super.merge({
                  JSON.create_id => self.class.name,
                  'publish_date' => @publish_date,
                  'multiplayer' => @multiplayer,
                  'last_played_at' => @last_played_at
                }).to_json(*args)
  end

  def self.json_create(object)
    game = new(Time.new(object['publish_date']), Time.new(object['last_played_at']), object['multiplayer'])
    game.id = object['id']
    game
  end

  private

  def can_be_archived?
    super && (Time.now.year - @last_played_at.year) > 2
  end
end