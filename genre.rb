class Genre
  attr_reader :name, :id

  def initialize(name, _id)
    @id = Random.rand(1..1000)
    @name = name
    @items = []
  end

  def add_item(item)
    @items << item
    item.add_genre(self)
  end
end

genre = Genre.new('Titi', 10)
puts genre.id
