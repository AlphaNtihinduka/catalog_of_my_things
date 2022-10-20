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
    @items << item
    # item.add_author(self)
  end

  def self.add_author
    print 'First Name: '
    first_name = gets.chomp.capitalize!
    print 'Last Name: '
    last_name = gets.chomp.capitalize!
    new(first_name, last_name)
  end

  def self.create_author(authors)
    print 'First Name: '
    first_name = gets.chomp
    print 'Last Name: '
    last_name = gets.chomp
    authors << Author.new(first_name, last_name)
    print 'Author created successfully "👨‍🦱👩"'
    puts ' '
  end

  def self.list_author(authors)
    if authors.empty?
      puts 'Sorry there are no authors available 😔'
    else
      authors.each_with_index do |author, i|
        puts "#{i} ID:\"#{author.id}\", First Name: \"#{author.first_name}\", Last Name :\"#{author.last_name}\" "
        puts '👨‍🏫📃'
      end
    end
  end
end

author = Author.new('Aneal', 'Layeal')
puts author.last_name
