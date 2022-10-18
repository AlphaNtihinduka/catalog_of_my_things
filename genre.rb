class Genre
    attr_reader :name, id

    def initialize(id, name)
        @id = Random.rand(1..1000)
        @name = name
        @items = []
    end
    
end