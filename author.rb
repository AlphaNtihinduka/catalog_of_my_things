class Author
    attr_accessor :first_name, :last_name, :items
    attr_reader :id

    def initialize(first_name, last_name)
        @id = Random.rand(1..1000)
        @first_name = first_name
        @last_name = last_name
        @items = []
    end

    def add_item(item)
       @items = push(item)
       item.add_author = self unless item.author == self
    end
end
author = Author.new('Aneal', 'Layeal')
puts author.last_name
