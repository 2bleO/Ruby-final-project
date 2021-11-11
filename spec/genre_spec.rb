require_relative 'spec_helper'

describe Genre do
  before :each do
    @genre = Genre.new 'dembow'
  end

  describe '#add_item' do
    it 'should add an item' do
      item = Item.new Time.now
      @genre.add_item item
      expect(@genre.items).to include(item)
    end

    it 'should have diferent ids' do
      item1 = Item.new Time.now
      item2 = Item.new Time.now
      @genre.add_item item1
      @genre.add_item item2
      expect(item1.id).not_to be == (item2.id)
    end
  end
end
