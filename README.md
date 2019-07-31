# TicCatToe


This is a simple **Tic-Tac-Toe** or **noughts and crosses** game or also known **Tres en Raya** (Spain, Peru), **Tatetí** (Argentina), **Gato** (Mexico, Chile), **Totito** (Guatemala); **Equis-cero** (Salvador), **Michi** (nickname for *Gato*), **Terni Lapilli** (Roman Empire), in some countries from LATAM it's know how **El juego de la vieja** or simply **la vieja**.

Tic-Tac-Toe is one of the first games to be played by children due to its fast setup and easy engagement.

## Rules
* Two players represented with X and O.
* First time the game is played, X startsEach player alternate turns to put a mark in the board on any available slot.
* The game ends when either one of the players matches three marks in a horizontal, vertical or diagonal row or 
there are no more moves available.
* Once the game finishes, players are asked if they want to play again. If they do, the player who lost the previous 
match starts. In case of a draw, the player who did the second-to-last movement starts.


## Installation

You can install the gem directly from *pkg* after neither clone or download this repository, or simply download
the gem file and install.

```ruby
gem install .\pkg\tic_cat_toe-0.1.0.gem
```

or

```ruby
gem install .\this\an\example\tic_cat_toe-0.1.0.gem
```

You can install it yourself as:

TODO: push gem to rubygems
```
gem install tic_cat_toe
```

## Usage

The program will ask you how big do you want the board's size. Please type an integer number between 3 and 9, be polite.

```ruby
require 'tic_cat_toe'
  => true
TicCatToe.play
  => Type an integer number=>
```

After that you have typed a number, it will show the board with coordinates for slots. 

```
[0,0   ][0,1   ][0,2   ]
[1,0   ][1,1   ][1,2   ]
[2,0   ][2,1   ][2,2   ]
Player X=>
```
Now you have to type the coordinate where you want to put your mark. Example: `1,1` or `1.2`.

```
[0,0   ][0,1   ][0,2   ]
[1,0   ][1,1 X ][1,2 O ]
[2,0   ][2,1   ][2,2   ]
Player X=>
```

The game indicates which player is next one. Once the game finishes, it will ask you if do you want to play another round in case if a player wins or it is a draw so if you wish, you have to type `yes` or `y`, then the game will restart.

```
WINS! Do you want to play again? Y/N
```

```
DRAW! Do you want to play again? Y/N
```
## Development

To run the tests, run `rake test`.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/Mojicator/TicCatToe.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
