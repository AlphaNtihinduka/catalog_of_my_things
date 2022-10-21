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
    @author = []
  end

  def save_data
    SaveGame.write_game(@games)
    SaveGame.write_author(@games)
  end

  def read_data
    SaveGame.read_author(@games)
    SaveGame.read_game(@games)
  end

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
    read_data
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
        Game.create_game(@games)
        SaveGame.write_game(@games)
        SaveGame.write_author(@games)
      when 6
        Game.list_games(@games)
      when 8
        Author.list_author(@games)
      when 9
        exit
      else
        puts 'Invalid option'
      end
    end
  end
end
