require 'json'
require_relative './author'
require_relative './game'

class SaveGame
  SAVE_DATA = './saved/'.freeze
  # write author
  def self.write_author(authors)
    author_array = []
    authors.each do |author|
      author_array << {
        id: author.id,
        first_name: author.first_name,
        last_name: author.last_name
      }
    end
    File.write('./saved/author.json', JSON.pretty_generate(author_array))
  end

  # read author
  def self.read_author(games)
    return games unless File.exist?('./saved/author.json')

    author_file = File.open('./saved/author.json')
    data = JSON.parse(author_file.read)
    data.each do |author|
      games << Game.new(author['publish_date'], author['last_played'], author['multiplayer'], author['first_name'],
                        author['last_name'])
    end
    author_file.close
    games
  end

  # write the game
  def self.write_game(games)
    return if games.empty?

    game_array = []
    games.each do |game|
      game_array << {
        id: game.id,
        publish_date: game.publish_date,
        last_played: game.last_played_at,
        multiplayer: game.multiplayer
      }
    end
    File.write('./saved/game.json', JSON.pretty_generate(game_array))
  end

  # read game data
  def self.read_game(games)
    # game_array = []
    return games unless File.exist?('./saved/game.json')

    game_file = File.open('./saved/game.json')
    data = JSON.parse(game_file.read)
    data.each do |game|
      games << Game.new(game['publish_date'], game['last_played'], game['multiplayer'], game['first_name'],
                        game['last_name'])
    end
    game_file.close
    games
  end
end
