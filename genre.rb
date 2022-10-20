class Genre
  attr_reader :name, :id

  def initialize(name, _id)
    @id = Random.rand(1..1000)
    @name = name
    @items = []
  end

  def add_album(album)
    @albums << album unless @albums.include?(album)
    album.source = self
  end

  def self.list_all_genres(genres)
    puts 'No genres found, please add a new music album.' if genres.empty?
    genres.map do |genre|
      puts "+ #{genre.name}"
    end
  end
end

genre = Genre.new('Titi', 10)
puts genre.id
