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
end