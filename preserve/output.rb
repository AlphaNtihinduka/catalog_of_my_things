require 'json'

class UserOutput
  def self.populate_albums(albums)
    return albums unless File.exist?('./json/musicalbums.json')

    object = JSON.parse(File.read('./json/musicalbums.json'))
    object.each do |album|
      genre = Genre.new(album['genre'])
      musicalbum_json = MusicAlbum.new(album['release_date'], album['title'], genre, album['on_spotify'])
      albums << musicalbum_json
    end
  end

  def self.populate_genres(genres)
    return genres unless File.exist?('./json/genres.json')

    object = JSON.parse(File.read('./json/genres.json'))
    object.each do |genre|
      genre_json = Genre.new(genre['name'])
      genre_json.id = genre['id']
      genres << genre_json
    end
  end

  def self.populate_data(albums, genres)
    populate_albums(albums)
    populate_genres(genres)
  end
end

# require 'json'
# require_relative 'input'

# module PreserveData
#     def store_music_album
#         data_array = []
#         @albums.each do | album |
#             data_array.push({
#                 Title: album.title,
#                 Published_date: album.publish_date,
#                 Genre: album.genre,
#                 on_spotify: album.on_spotify
#             })
#             end

#             write_json(data_array, './storedata/musicAlbumData.json')
#     end

#     def Read_json
#         readData = []
#         readers = Read_json('./storedata/musicAlbumData.json')
#         readers.each do |reader|
#             music = MusicAlbum.new(reader['title'], reader['publish_date'], reader['genre'], reader['on_spotify'])
#             readData.push(music)
#         end
#         readData
#     end
# end