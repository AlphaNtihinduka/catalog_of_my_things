require './item'
require './book'
require './label'

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
    4. Add a label
    5. Exit
    Please choose an option:'
  end

  def menu
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
      when 5 then exit
      else puts 'Invalid option'
      end
    end
  end
end