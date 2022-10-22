require_relative './item'

class Game < Item
  attr_reader :multiplayer, :last_played_at
  attr_accessor :author

  def initialize(publish_date, last_played_at, multiplayer)
    super(publish_date)
    @last_played_at = last_played_at
    @multiplayer = multiplayer
    @author = []
  end

  def can_be_archived?
    super && Date.today - Date.parse(@last_played_at) > 730
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
    print 'It is a Multiplayer game [y/n]: '
    multiplayer_game = gets.chomp
    multiplayer_choice = case multiplayer_game.downcase
                         when 'y'
                           true
                         else
                           false
                         end
    games << Game.new(date_published, last_played, multiplayer_choice)
    new_author = Author.new(first_name, last_name)
    new_author.add_item(games)
    print 'Game created successfully 😊 😀'
    puts ''
  end

  def self.list_games(games)
    if games.empty?
      puts 'Sorry! There are no games ☹️ '
      puts ''
    else
      games.each_with_index do |game, i|
        puts "#{i} Publihed date:\"#{game.publish_date}\",
        Last Played:\"#{game.last_played_at}\",
        Multiplayer:\"#{game.multiplayer}\" "
      end
    end
  end
end
