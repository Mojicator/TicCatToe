# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../lib/tic_cat_toe/board'

describe Board do
  before do
    @size = 3
    @board = Board.new(@size)
  end
  describe '#check_board' do
    it 'works when the board is empty' do
      @board.check_board('X').must_equal false
    end
    it 'checks horizontal line match' do
      @board.slots = [
        'X', 'X', 'X',
        nil, nil, nil,
        nil, nil, nil
      ]
      @board.check_board('X').must_equal true
      @board.slots = [
        nil, nil, nil,
        'X', 'X', 'X',
        nil, nil, nil
      ]
      @board.check_board('X').must_equal true
      @board.slots = [
        nil, nil, nil,
        nil, nil, nil,
        'O', 'O', 'O'
      ]
      @board.check_board('O').must_equal true
    end
    it 'checks vertical line match' do
      @board.slots = [
        'X', nil, nil,
        'X', nil, nil,
        'X', nil, nil
      ]
      @board.check_board('X').must_equal true
      @board.slots = [
        nil, 'O', nil,
        nil, 'O', nil,
        nil, 'O', nil
      ]
      @board.check_board('O').must_equal true
      @board.slots = [
        nil, nil, 'X',
        nil, nil, 'X',
        nil, nil, 'X'
      ]
      @board.check_board('X').must_equal true
    end
    it 'checks diagonal line match' do
      @board.slots = [
        'O', nil, nil,
        nil, 'O', nil,
        nil, nil, 'O'
      ]
      @board.check_board('O').must_equal true
      @board.slots = [
        nil, nil, 'X',
        nil, 'X', nil,
        'X', nil, nil
      ]
      @board.check_board('X').must_equal true
    end
  end
  describe '#available_slots' do
    it 'checks if there are available slots' do
      @board.slots = [
        'X', 'O', 'X',
        'O', nil, 'X',
        'O', 'X', 'O'
      ]
      @board.available_slots.must_equal false
    end
    it 'checks when it is a draw' do
      @board.slots = [
        'X', 'O', 'X',
        'O', 'X', 'X',
        'O', 'X', 'O'
      ]
      @board.available_slots.must_equal true
      @board.slots = [
        'X', 'X', 'O',
        'O', 'O', 'X',
        'X', 'O', 'X'
      ]
      @board.available_slots.must_equal true
    end
  end
  describe '#check_slot' do
    it 'checks if a slot is already took' do
      @board.slots = [
        'X', nil, 'O',
        'O', 'O', 'X',
        'X', 'O', 'X'
      ]
      @board.check_slot(0, 0).must_equal false
      @board.check_slot(0, 1).must_equal true
    end
  end
end
