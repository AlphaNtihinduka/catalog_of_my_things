require_relative './item'

class MusicAlbum < Item
  attr_accessor  :title, :publish_date, :genre, :on_spotify

  def initialize(title, publish_date, genre, on_spotify)
    super(publish_date)
    @title = title
    @publish_date = publish_date  
    @genre = genre
    @on_spotify = on_spotify
  end

  def add_genre(genre)
    genre.albums.push(self) unless genre.albums.include?(self)
  end  
  # def add_music_album
  #   @genre.push(self) unless genre.music_album.includes?(self) 
  # end

  def self.list_all_albums(albums)
    if albums.empty?
      puts 'Oops! no album available '
      else
        albums.each_with_index { |album, i| 
          puts "#{i} Title:\"#{album.title}\", Published_date:\"#{album.publish_date}\", Genre:\"#{album.genre}\",  Spotify:\"#{album.on_spotify}\" "
        }
      end
  end

  def self.create_music_album(albums)
    puts 'What date was the music album published [dd/mm/yyyy]: '
    publish_date = gets.chomp
    puts 'Add title: '
    title = gets.chomp
    puts 'What type of genre is the music album: '
    genre = gets.chomp
    puts 'Is the music album on spotify? [Y/N]: '
    is_on_spotify = gets.chomp
    spotify_choice = case is_on_spotify.upcase 
                  when 'Y'
                    true
                  else
                    false
                  end
    albums << MusicAlbum.new(title, publish_date, genre, spotify_choice)
    puts 'Music Album created succesfully '
  end
  def can_be_archived?
    true if super() && @on_spotify
  end
end