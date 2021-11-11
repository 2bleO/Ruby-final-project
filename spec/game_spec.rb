require_relative 'spec_helper'

describe Game do
  before :each do
    @game1 = Game.new Time.new('2009/05/10'), Time.new('2018/08/08'), true
    @game2 = Game.new Time.now, Time.now, true
    @game3 = Game.new Time.new('2015/05/10'), Time.new('2016/05/10'), true
  end

  describe '#new' do
    it 'returns a Game object' do
      expect(@game1).to be_an_instance_of(Game)
    end
  end

  describe '#can_be_archived' do
    context 'when published over 10 years ago and last played over 2 years' do
      it 'should return true' do
        @game1.move_to_archive
        expect(@game1.archived).to be_truthy
      end
    end

    context 'when published less than 10 years ago and last played less than 2 years' do
      it 'should return false' do
        @game2.move_to_archive
        expect(@game2.archived).to be_falsey
      end
    end

    context 'when published less than 10 years ago and last played over 2 years' do
      it 'should return false' do
        @game3.move_to_archive
        expect(@game3.archived).to be_falsey
      end
    end
  end
end