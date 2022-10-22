require './item'
require './book'
require './label'
require './game'
require './author'
require_relative './save_game'

class App
  def initialize
    @books = []
    @labels = []
    @games = []
    @authors = []
  end

  # def save_data
  #   SaveGame.write_game(@games)
  #   SaveGame.write_author(@games)
  # end

  # def read_data
  #   SaveGame.read_author(@authors)
  #   SaveGame.read_game(@games)
  # end

  def options
    'Do you want to choose an option in the menu? Please type an option number:
    1. List all books
    2. List all labels
    3. Add a book
    4. Add a label
    5. Add Game 🎮🎇
    6. list all Games 🎮📃
    8. List all Authors 📃👨‍🏫
    9. Exit
    Please choose an option:'
  end

  def menu
    # read_data
    puts 'Welcome to my catalog'
    puts '💥💥💥💥💥💥💥'
    loop do
      puts options
      puts '***********'
      option = gets.chomp.to_i
      case option
      when 1
        Book.list_all_books(@books)
      when 2
        Label.list_all_labels(@labels)
      when 3
        Book.add_book(@books)
      when 4
        Label.add_label(@labels)
      when 5
        create_game
        SaveGame.write_game(@games)
        SaveGame.write_author(@authors)
      when 6
        list_games
      when 8
        SaveGame.read_author
      when 9
        exit
      else
        puts 'Invalid option'
      end
    end
  end

  def create_game
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
    game = Game.new(publish_date, last_played, multiplayer_choice)
    author = add_author
    author.add_game(game)
    @games << game
    @authors << author
    print 'Game created successfully 😊 😀'
    puts ''
  end

  def add_author
    print 'Enter first name: '
    first_name = gets.chomp
    print 'Enter last name: '
    last_name = gets.chomp
    Author.new(first_name, last_name)
  end

  def list_author
    if @authors.empty?
      puts 'Sorry there are no authors available 😔'
      puts ''
    else
      @authors.each_with_index do |author, i|
        puts "#{i} ID:\"#{author.id}\", First Name: \"#{author.first_name}\", Last Name :\"#{author.last_name}\" "
        puts '👨‍🏫📃'
      end
    end
  end

  def list_games
    puts 'Sorry! There are no games ☹️ , please add a game by using the list of options.' if @games.empty?
    puts ''
    @games.each_with_index do |game, i|
      puts "#{i} Published date:\"#{game.publish_date}\", Last Played:\"#{game.last_played_at}\", Multiplayer:\"#{game.multiplayer}\" "
    end
  end
end
