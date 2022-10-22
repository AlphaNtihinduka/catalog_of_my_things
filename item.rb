require 'time'

class Item
  attr_accessor :publish_date, :archieved, :id, :genre, :author, :source, :label

  def initialize(publish_date)
    @id = Random.rand(1..1000)
    @publish_date = publish_date
    @archieved = false
  end

  def add_genre(genre)
    @genre = genre
  end

  def add_author(author)
    @author = author
    # author.add_item(self) unless author.items.include?(self)
  end

  def add_source(source)
    @source = source
  end

  def add_label(label)
    @label = label
    label.items << self unless label.items.include?(self)
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
