# frozen_string_literal: true

# Here I go again
class Board
  attr_accessor :slots
  attr_reader :size

  def initialize(size)
    @size = size
    @slots = build_tic_tac_toe(size)
  end

  def build_tic_tac_toe(size)
    size >= 3 ? Array.new(size**2) : Array.new(3)
  end

  def to_print
    @size.times do |index|
      @size.times do |jndex|
        case @slots[@size * index + jndex]
        when 'X' then print "\e[1;31m[#{index},#{jndex} X ]\e[0m"
        when 'O' then print "\e[1;36m[#{index},#{jndex} O ]\e[0m"
        else print "[#{index},#{jndex}   ]"
        end
      end
      puts
    end
  end

  def check_slot(row, col)
    # @slots[@size * row + col] != 'X' && @slots[@size * row + col] != 'O' ? true : false
    # @slots[@size * row + col].match(/^[X|O]$/) ? false : true
    @slots[@size * row + col].nil? ? true : false
  end

  def put_mark(row, col, mark)
    @slots[@size * row + col] = mark
    check_board(mark)
  end

  def vertical(mark)
    @size.times do |col|
      matches_count = 0
      @size.times do |index|
        matches_count += 1 if /^#{mark}$/.match(@slots[@size * index + col])
        return true if matches_count.equal?(@size)
      end
    end
    false
  end

  def horizontal(mark)
    @size.times do |row|
      matches_count = 0
      @size.times do |index|
        matches_count += 1 if /^#{mark}$/.match(@slots[@size * row + index])
        return true if matches_count.equal?(@size)
      end
    end
    false
  end

  def negative_line(mark)
    matches_count = 0
    @size.times do |index|
      matches_count += 1 if /^#{mark}$/.match(@slots[index * (@size + 1)])
      return true if matches_count.equal?(@size)
    end
    false
  end

  def positive_line(mark)
    matches_count = 0
    @size.times do |index|
      matches_count += 1 if /^#{mark}$/.match(@slots[(index + 1) * (@size - 1)])
      return true if matches_count.equal?(@size)
    end
    false
  end

  def diagonals(mark)
    negative_line(mark) || positive_line(mark) ? true : false
  end

  def check_board(mark)
    vertical(mark) || horizontal(mark) || diagonals(mark) ? true : false
  end

  def available_slots
    @slots.compact.length.equal?(@size**2) ? true : false
  end
end
