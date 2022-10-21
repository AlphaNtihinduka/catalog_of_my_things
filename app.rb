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
  end

  def read_data
    SaveGame.read_author(@author)
  end

  def options
    'Do you want to choose an option in the menu? Please type an option number:
    1. List all books
    2. List all labels
    3. Add a book
    4. Add a label
    5. Add Game 🎮🎇
    6. list all Games 🎮📃
    7. Add Author 👨‍🦱👩
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
      when 1 then Book.list_all_books(@books)
      when 2 then Label.list_all_labels(@labels)
      when 3 then Book.add_book(@books)
      when 4 then Label.add_label(@labels)
      when 5 then Game.create_game(@games)
      when 6 then Game.list_games(@games)
      when 7 then Author.create_author(@author)
      when 8 then Author.list_author(@author)
      when 9 then save_data exit
      else puts 'Invalid option'
      end
    end
  end
end
