require './item'
require './book'
require './label'
require_relative './json_handler'

class App
  def initialize
    @books = []
    @labels = []
  end

  def options
    'Do you want to choose an option in the menu? Please type an option number:
    1. List all books
    2. List all labels
    3. Add a book
    4. Exit
    Please choose an option:'
  end

  def save_data
    JsonHandler.write_books(@books)
    JsonHandler.write_labels(@labels)
  end

  def read_data
    JsonHandler.read_books(@books)
    JsonHandler.read_labels(@labels)
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
      when 4
        save_data
        exit
      else puts 'Invalid option'
      end
    end
  end
end
