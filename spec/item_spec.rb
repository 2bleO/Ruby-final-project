require 'spec_helper'

describe Item do
  before :each do
    @item = Item.new(Time.now)
  end

  describe '#can_be_archived?' do
    it 'should return true if published_date is older than 10 years' do
      @item = Item.new(Time.new('2010/10/10'))
      @item.move_to_archive
      expect(@item.archived).to be_truthy
    end

    it 'should return false if published_date is less than 10 years' do
      @item.move_to_archive
      expect(@item.archived).to eql false
    end
  end
end
