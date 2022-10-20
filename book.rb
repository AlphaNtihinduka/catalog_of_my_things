require './item'

class Book < Item
  attr_accessor :publisher, :cover_state, :label

  def initialize(publish_date, publisher, cover_state, label)
    @publisher = publisher
    @cover_state = cover_state
    @label = label
    super(publish_date)
  end

  def can_be_archieved?
    super || @cover_state == 'bad'
  end

  def self.add_book(books)
    puts 'Add a book'
    print 'Publish Date: '
    publish_date = input_date
    print 'Publisher: '
    publisher = gets.chomp
    print 'Cover state Date["good" or "bad"]: '
    cover_state = gets.chomp.downcase
    puts 'Add a label'
    print 'Title: '
    title = gets.chomp
    print 'Color: '
    color = gets.chomp
    label = Label.new(title, color)
    new_book = Book.new(publish_date, publisher, cover_state, label)
    books << new_book
    label.add_book(new_book)
    puts '💥A book is added successfullly'
    puts ''
  end
end
