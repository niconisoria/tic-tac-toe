require_relative 'Player'
require_relative 'Board'
class Game
    attr_reader :current_player, :other_player
    def initialize player1, player2, board = Board.new
        @player1 = player1
        @player2 = player2
        @board = board
        @current_player = @player1
        @other_player = @player2
    end

    def start
        puts 'TIC TAC TOE'
        puts '-----------'
        puts 'Player 1'
        @player1.choose_name
        @player2.choose_marker
        puts '-----------'
        puts 'Player 2'
        @player2.choose_name
        if @player1.marker = 'x'
            @player2.marker = 'o'
        else
            @player2.marker = 'x'
        end
    end

    def play
        while true
            @board.draw_grid
            puts '-----------'
            puts "#{current_player.name}'s turn"
            puts '-----------'
            ask_move
            make_move
            if @board.finished
                game_over
                @board.draw_grid
                return false
            else
                switch_players
            end
        end
    end

    def ask_move
        puts "Choose a number between 1 and 9 to mark a position"
    end

    def make_move 
        @board.mark_position gets.chomp, current_player.marker
    end

    def game_over
        puts "#{current_player.name} is the winner!" if @board.finished == :winner
        puts "Draw!" if @board.finished == :draw
    end

    def switch_players
        @current_player, @other_player = @other_player, @current_player
    end
end

board = Board.new
player1 = Player.new
player2 = Player.new
game = Game.new(player1, player2, board)
game.start
game.play
