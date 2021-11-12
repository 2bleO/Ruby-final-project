require_relative 'spec_helper'

describe Book do
  before :each do
    @book1 = Book.new Time.new('2009/05/10'), 'alfaguara', 'good'
    @book2 = Book.new Time.now, 'alfaguara', 'bad'
    @book3 = Book.new Time.now, 'alfaguara', 'good'
  end

  describe '#book' do
    it 'returns a Book object' do
      expect(@book1).to be_an_instance_of(Book)
    end
  end

  describe '#can_be_archived?' do
    context 'when 10 years old or cover is bad' do
      it 'can be archived' do
        @book1.move_to_archive
        expect(@book1.archived).to be_truthy
      end

      it 'can be archived' do
        @book2.move_to_archive
        expect(@book2.archived).to be_truthy
      end
    end

    context 'when less than 10 years and cover is good' do
      it 'cannot be archived' do
        @book3.move_to_archive
        expect(@book3.archived).to be_falsey
      end
    end
  end
end
