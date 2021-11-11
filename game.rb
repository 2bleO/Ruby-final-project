require_relative 'item'

class Game < Item
  def initialize(publish_date, last_played_at, multiplayer)
    super(publish_date)
    @multiplayer = multiplayer
    @last_played_at = last_played_at
  end

  private

  def can_be_archived?
    super && (Time.now.year - @last_played_at.year) > 2
  end
end