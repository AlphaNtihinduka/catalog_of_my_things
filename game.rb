require_relative './item'
require './save_game'

class Game < Item
  attr_reader :id
  attr_accessor :author, :publish_date, :multiplayer, :last_played_at

  def initialize(publish_date, last_played_at, multiplayer, author)
    super(publish_date)
    @last_played_at = last_played_at
    @multiplayer = multiplayer
    @author = author
  end

  def self.create_game(games)
    print 'First Name: '
    first_name = gets.chomp
    print 'Last name: '
    last_name = gets.chomp
    print 'Date Published: '
    date_published = gets.chomp
    print 'Last Played (eg:[2019/01/04]): '
    last_played = gets.chomp
    print 'It is a Multiplayer game [Y/N]: '
    multiplayer_game = gets.chomp
    multiplayer_choice = multiplayer_game.downcase
    # multiplayer_choice = case multiplayer_game.downcase
    #                      when 'y'
    #                        "Yes"
    #                      else
    #                        false
    #                      end
    new_author = Author.new(first_name, last_name)
    games << new_author
    games << Game.new(date_published, last_played, multiplayer_choice, new_author)
    print 'Game created successfully 😊 😀'
    puts ''
    # SaveGame.write_game(games)
  end

  def self.list_games(games)
   # SaveGame.read_game(games)
    # if games.empty?
    #   puts 'Sorry! There are no games ☹️ '
    #   puts ''
    # else
    puts 'No games added, please add a game by using the list of options.' if games.empty?
      games.each_with_index do |game, i|
        puts "#{i} Published date:\"#{game.publish_date}\",
        Last Played:\"#{game.last_played_at}\",
        Multiplayer:\"#{game.multiplayer}\" "
      end
  end

  private
  def can_be_archived?
    super && Date.today - Date.parse(@last_played_at) > 730
  end

end
