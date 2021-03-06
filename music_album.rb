require_relative 'item'

class MusicAlbum < Item
  def initialize(publish_date, on_spotify)
    super(publish_date)
    @on_spotify = on_spotify
  end

  def to_s
    "[Music Album] On Spotify: #{@on_spotify}, #{super}"
  end

  def to_json(*args)
    super.merge({
                  JSON.create_id => self.class.name,
                  'on_spotify' => @on_spotify
                }).to_json(*args)
  end

  def self.json_create(object)
    music_album = new(Time.new(object['publish_date']), object['on_spotify'])
    music_album.id = object['id']
    music_album
  end

  private

  def can_be_archived?
    super && @on_spotify
  end
end
