require_relative './item'

class Game < Item
    attr_reader :multiplayer, :last_played_at
    attr_accessor :author

    def initialize(publish_date, last_played_at, multiplayer)
        super(publish_date)
        @last_played_at = last_played_at
        @multiplayer = multiplayer
    end

    def can_be_archived?
        super && Date.today - Date.parse(@last_played_at) > 730
    end
end

game = Game.new('2022/10/19', '2021/10/10', false)
puts game.multiplayer
