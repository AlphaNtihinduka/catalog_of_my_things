class Label
  attr_accessor :title, :color
  attr_reader :items, :id

  def initialize(title, color)
    @id = Random.rand(1..1000)
    @title = title
    @color = color
    @items = []
  end

  def add_item(item)
    @items << item unless @items.include?(item)
    item.label = self
  end


  def self.add_label(labels)
    puts 'Add a label'
    print 'Title: '
    title = gets.chomp
    print 'Color: '
    color = gets.chomp
    labels << Label.new(title, color)
    puts '💥A label is added successfullly'
    puts ''
  end
end
