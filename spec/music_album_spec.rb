require_relative 'spec_helper'

describe MusicAlbum do
  before :each do
    @album1 = MusicAlbum.new Time.new('2009/05/10'), true
    @album2 = MusicAlbum.new Time.new('2009/05/10'), false
    @album3 = MusicAlbum.new Time.now, true
    @album4 = MusicAlbum.new Time.now, false
  end

  describe '#can_be_archived' do
    context 'when published over 10 years ago and on spotify' do
      it 'should return true' do
        @album1.move_to_archive
        expect(@album1.archived).to be(true)
      end
    end

    context 'when published over 10 years ago and not on spotify' do
      it 'should return false' do
        @album2.move_to_archive
        expect(@album2.archived).to be(false)
      end
    end

    context 'when published less than 10 years ago and on spotify' do
      it 'should return false' do
        @album3.move_to_archive
        expect(@album3.archived).to be(false)
      end
    end

    context 'when published less than 10 years ago and not on spotify' do
      it 'should return false' do
        @album4.move_to_archive
        expect(@album4.archived).to be(false)
      end
    end
  end
end
