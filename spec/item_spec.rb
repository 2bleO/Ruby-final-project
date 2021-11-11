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

  describe '#add_genre' do
    it 'should add a genre' do
      @item.add_genre Genre.new('salsa')
      expect(@item.genre).to be_an_instance_of Genre
    end
  end

  describe '#add_author' do
    it 'should add an author' do
      @item.add_author Author.new('gabriel', 'garcia marquez')
      expect(@item.author).to be_an_instance_of Author
    end
  end

  describe '#add_source' do
    it 'should add a source' do
      @item.add_source Source.new('friend')
      expect(@item.source).to be_an_instance_of Source
    end
  end

  describe '#add_label' do
    it 'should add a label' do
      @item.add_label Label.new('microverse', 'red')
      expect(@item.label).to be_an_instance_of Label
    end
  end
end
