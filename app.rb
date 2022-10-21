require './item'
require './book'
require './label'
require './music_album'
require './genre'
require './preserve/input'
require './preserve/output'

class App
  def initialize
    @books = []
    @labels = []
    @albums = UserOutput.populate_albums
    @genres = UserOutput.populate_genres
  end

  def options
    'Do you want to choose an option in the menu? Please type an option number:
    1. List all books
    2. List all labels
    9. List all Music Album
    10. List all Genres
    3. Add a book
    4. Add a label
    11. Add a Music Album
    25. Exit
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
      when 9 then MusicAlbum.list_all_albums(@albums)
      when 10 then Genre.list_all_genres(@genres)
      when 3 then Book.add_book(@books)
      when 4 then Label.add_label(@labels)
      when 11 then MusicAlbum.create_music_album(@albums, @genres)
      when 25
        UserInput.save_data(@albums, @genres)
        exit
      else puts 'Invalid option'
      end
    end
  end
end
