require_relative './item'
require './save_game'

class Game < Item
  attr_reader :id
  attr_accessor :author, :publish_date, :multiplayer, :last_played_at, :first_name, :last_name

  def initialize(publish_date, last_played_at, multiplayer, first_name, last_name)
    super(publish_date)
    @last_played_at = last_played_at
    @multiplayer = multiplayer
    @author = author
    @first_name = first_name
    @last_name = last_name
  end

  def self.create_game(games)
    print 'First Name: '
    first_name = gets.chomp
    print 'Last name: '
    last_name = gets.chomp
    print 'Date Published: '
    publish_date = gets.chomp
    print 'Last Played (eg:[2019/01/04]): '
    last_played = gets.chomp
    print 'It is a Multiplayer game [Y/N]: '
    multiplayer_game = gets.chomp
    multiplayer_choice = case multiplayer_game.downcase
                         when 'y'
                           'Yes'
                         else
                           'No'
                         end
    new_author = Author.new(first_name, last_name)
    games << Game.new(publish_date, last_played, multiplayer_choice, first_name, last_name)
    @author = new_author
    print 'Game created successfully 😊 😀'
    puts ''
  end

  def self.list_games(games)
    puts 'Sorry! There are no games ☹️ , please add a game by using the list of options.' if games.empty?
    puts ''
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
