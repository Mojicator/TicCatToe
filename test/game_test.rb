# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../lib/tic_cat_toe/game'

describe Game do
  before do
    @game = Game.new(3, 'X')
  end
  describe '#check_range' do
    it 'checks if the selected slot is in range' do
      @game.check_range(0, 0).must_equal true
      @game.check_range(-1, 0).wont_equal true
      @game.check_range(2, 100).wont_equal true
    end
  end
  describe '#check_size' do
    it 'check if the setted size is playable' do
      @game.check_size(nil).wont_equal true
      @game.check_size(2).wont_equal true
      @game.check_size(7).must_equal true
      @game.check_size('7').must_equal false
      @game.check_size(50_000).wont_equal true
    end
  end
end
