require 'json'
require_relative './author'
require_relative './game'

class SaveGame
  SAVE_DATA = './saved/'.freeze
  # write author
  def self.write_author(authors)
    path_file = "#{SAVE_DATA}author.json"
    author_array = []
    authors.each do |author|
      author_array << {
        id: author.id,
        first_name: author.first_name,
        last_name: author.last_name
      }
    end
    File.write(path_file, JSON.pretty_generate(author_array,  { indent: "\t", object_nl: "\n" }))

  end

  # read author
  def self.read_author(_author)
    author_array = []
    return author_array unless File.exist?('./saved/author.json')

    author_file = File.open('./saved/author.json')
    data = JSON.parse(author_file.read)
    data.each do |author|
      author_array << Author.new(author['first_name'], author['last_name'])
    end
    author_file.close
    author_array
  end

  # write the game
  def self.write_game(games)
    return if games.empty?
    path_file = "#{SAVE_DATA}game.json"
    # game_array = []
    # games.each do |game|
    #   game_array << {
    #     id: game.id,
    #     publish_date: game.publish_date,
    #     last_played: game.last_played_at,
    #     multiplayer: game.multiplayer
    #   }
    data_games = games.map do |game|
      {
        id: game.id,
        title: game.title,
        multiplayer: game.multiplayer,
        last_played: game.last_played,
        publish_date: game.publish_date
      }

    end
    File.write(path_file, JSON.pretty_generate(data_games))
  end

  #read game data
  def self.read_game
    game_array = []
    return game_array unless File.exist?('./saved/game.json')

    game_file = File.open('./saved/game.json')
    data = JSON.parse(game_file.read)
    data.each do |game|
      game_array << Game.new(game['publish_date'], game['last_played'], game['multiplayer'])
    end
    game_file.close
    game_array
  end

end
