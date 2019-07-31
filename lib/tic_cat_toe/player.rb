# frozen_string_literal: true

# Player methods
class Player
  attr_reader :mark, :victories

  def initialize(simbol)
    @mark = simbol
    @victories = 0
  end

  def wins
    @victories += 1
  end
end
