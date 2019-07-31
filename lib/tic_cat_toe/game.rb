# frozen_string_literal: true

require 'os'
require_relative './board'
require_relative './player'

# The Game
class Game
  attr_accessor :board, :player1, :player2, :winner, :current_player

  def initialize(*args)
    puts args
    @board = Board.new(args[0] || 3)
    @current_player = args[1] || 'O'
    @player1 = Player.new('X')
    @player2 = Player.new('O')
    @current_x = 0
    @current_y = 0
    @winner = false
  end

  def check_input(input)
    if /^([0-9]+)[,|.]\s*([0-9]+)$/.match(input)
      x = input.split(//)[0].to_i
      y = input.split(//)[2].to_i
      if check_range(x, y) && check_duplicate(x, y)
        @current_x = x
        @current_y = y
        return true
      end
    end
    false
  end

  def check_size(size)
    size.is_a?(Integer) && (3..9).cover?(size) ? true : false
  end

  def check_range(abs, ord)
    (0..@board.size).cover?(abs) && (0..@board.size).cover?(ord) ? true : false
  end

  def check_duplicate(abs, ord)
    @board.check_slot(abs, ord) ? true : false
  end

  def check_slots?
    @board.available_slots ? true : false
  end

  def yes_not(input)
    input.eql?('y') || input.eql?('yes') ? play : false
  end

  def show_game
    OS.windows? ? system('cls') : system('clear')
    # system('cls')
    # puts "Player X: #{player1.victories} Player O: #{player2.victories}"
    @board.to_print
  end

  def next_turn(mark)
    case mark
    when 'X' then 'O'
    when 'O' then 'X'
    end
  end

  def player_move(mark)
    print "Player #{mark}=> "
    player = gets.chomp
    case check_input(player)
    when true
      @winner = @board.put_mark(@current_x, @current_y, mark)
      @current_player = next_turn(mark)
    when false then player_move(mark)
    else puts 'Something has gone wrong'
    end
  end

  def check_game
    show_game
    case @winner
    when true
      @current_player = next_turn(@current_player)
      puts "#{@current_player} WINS! Do you want to play again? Y/N"
      yes_not(gets.chomp.downcase)
    when false
      puts 'DRAW! Do you want to play again? Y/N'
      yes_not(gets.chomp.downcase)
    end
  end

  def play
    puts 'Type an integer number=> '
    new_dimention = gets.chomp.to_i
    if check_size(new_dimention)
      initialize(new_dimention, next_turn(@current_player))
      run
    else
      play
    end
  end

  def run
    while @winner != true
      break if check_slots?

      show_game
      case @current_player
      when player1.mark then player_move(player1.mark)
      when player2.mark then player_move(player2.mark)
      else puts 'Comun demonio! Lo que faltaba'
      end
    end
    check_game
  end
end
