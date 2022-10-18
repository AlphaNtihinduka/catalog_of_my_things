class Genre
    attr_reader :name, id

    def initialize(id, name)
        @id = Random.rand(1..1000)
        @name = name
        @items = []
    end
    
    def add_item(item)
        @items << item
        item.add_genre(self)
    end
end