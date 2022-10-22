class Label
  attr_accessor :title, :color
  attr_reader :books, :id

  def initialize(title, color)
    @id = Random.rand(1..1000)
    @title = title
    @color = color
    @books = []
  end

  def add_book(book)
    @books << book unless @books.include?(book)
    book.label = self
  end

  # def self.add_label(labels)
  #   puts 'Add a label'
  #   print 'Title: '
  #   title = gets.chomp
  #   print 'Color: '
  #   color = gets.chomp
  #   labels << Label.new(title, color)
  #   puts '💥A label is added successfullly'
  #   puts ''
  # end

  def self.list_all_labels(books)
    if books.empty?
      puts 'The Catalog has no labels'
    else
      puts '💥List of all labels:'
      books.each_with_index do |book, index|
        puts "[#{index + 1}] Title: #{book.title}, Color: #{book.color}"
      end
    end
    puts ''
  end
end
