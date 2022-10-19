require './item'

class Book < Item
  attr_accessor :publisher, :cover_state

  def initialize(publish_date, publisher, cover_state)
    @publisher = publisher
    @cover_state = cover_state
    super(publish_date)
  end

  def can_be_archieved?
    super || @cover_state == 'bad'
  end

  def self.add_book(books)
    puts 'Add a book'
    print 'Publish Date: '
    publish_date = gets.chomp
    print 'Publisher: '
    publisher = gets.chomp
    print 'Cover state Date: '
    cover_state = gets.chomp
    books << Book.new(publish_date, publisher, cover_state)
    puts '💥A book is added successfullly'
    puts ''
  end
end

end
