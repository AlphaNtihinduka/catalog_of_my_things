require './save_game'
class Author
  attr_accessor :id, :first_name, :last_name
  attr_reader :games

  def initialize(first_name, last_name)
    @id = Random.rand(1..1000)
    @first_name = first_name
    @last_name = last_name
    @games = []
  end

  def add_game(game)
    @games << game unless @games.include?(game)
    game.author = self
  end

  def self.list_author(authors)
    if authors.empty?
      puts 'Sorry there are no authors available 😔'
      puts ''
    else
      authors.each_with_index do |author, i|
        puts "#{i} ID:\"#{author.id}\", First Name: \"#{author.first_name}\", Last Name :\"#{author.last_name}\" "
        puts '👨‍🏫📃'
      end
    end
  end
end
