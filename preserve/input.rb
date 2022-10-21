require 'json'

class UserInput
  def self.save_albums(albums)
    musicalbums_json = []
    albums.each do |album|
      album = {
        id: album.id.to_s,
        title: album.title,
        # genre: album.genre.name,
        release_date: album.publish_date,
        on_spotify: album.on_spotify.to_s
      }
      musicalbums_json << album
    end
    File.write('./json/musicalbums.json', JSON.pretty_generate(musicalbums_json, { indent: "\t", object_nl: "\n" }))
  end

  def self.save_genres(genres)
    genres_json = []
    genres.each do |genre|
      genre = {
        id: genre.id.to_s,
        name: genre.name
      }
      genres_json << genre
    end
    File.write('./json/genres.json', JSON.pretty_generate(genres_json, { indent: "\t", object_nl: "\n" }))
  end

  def self.save_data(albums, genres)
    save_albums(albums)
    save_genres(genres)
  end
end


# require 'json'

# module FileHandle 
#     def write_json(file_name, array)
#         return unless if File.exist?(file_name)
#  opts = {
#     array_nl: '\nl',
#     object_nl: '\nl',
#     indent: '   ',
#     space: ' ',
#     space_before: ' '
#  }
#  File.write(file_name, JSON.pretty_generate(array, opts))
        
#     end

#     def Read_json(file_name)
#         file = File.read(file_name)
#         JSON.parse.file
#     end
#  end
# end