require_relative 'spec_helper'

describe Author do
  before :each do
    @author = Author.new('richard', 'chapman')
  end

  describe '#add_item' do
    it 'should add an item' do
      item = Item.new Time.now
      @author.add_item item
      expect(@author.items).to include(item)
    end

    it 'should have diferent ids' do
      item1 = Item.new Time.now
      item2 = Item.new Time.now
      @author.add_item item1
      @author.add_item item2
      expect(item1.id).not_to be == (item2.id)
    end
  end
end
