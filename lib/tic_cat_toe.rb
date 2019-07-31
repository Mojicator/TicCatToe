# frozen_string_literal: true

require 'os'
require_relative 'tic_cat_toe/version'
require_relative 'tic_cat_toe/game'

# Ready to play
module TicCatToe
  class Error < StandardError; end

  def self.play
    game = Game.new
    game.play
  end
end
