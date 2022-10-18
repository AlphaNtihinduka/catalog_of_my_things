require 'time'

class Item
  attr_reader :id, :genre, :author, :source, :label
  attr_accessor :publish_date, :archieved

  def initialize(publish_date, _archieve: false)
    @id = Random.rand(1..1000)
    @publish_date = publish_date
    @archieved = archieved
  end

  def add_genre(genre)
    @genre = genre
  end

  def add_author(author)
    @author = author
    author.add_item(self) unless author.items.include?(self)
  end


  def add_source(source)
    @source = source
  end

  def add_label(label)
    @label = label
  end

  def move_to_achieve
    @archieved = true if can_be_archieved?
  end

  private

  def can_be_archieved?
    current_year = Time.new.year
    year_publication = Time.parse(@publish_date).year
    current_year - year_publication > 10
  end
end

item = Item.new('13 December 2021')
puts item.move_to_achieve
