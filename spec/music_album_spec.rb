require_relative './music_album'

describe MusicAlbum do
  it 'creates a new music album instance' do
    expect(music_album.on_spotify).to eq(true)
  end
end
