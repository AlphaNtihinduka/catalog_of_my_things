class MusicAlbum
    attr_accessor :on_spotify
    attr_reader :can_be_archived?

    def initialize(on_spotify, *args)
        super(*args)
        @on_spotify = on_spotify
        @can_be_archived = can_be_archived
    end
end