require_relative 'spec_helper'

describe MusicAlbum do
  it 'creates a new music album instance' do
    music_album = MusicAlbum.new(true, '12 December 2021')
    expect(music_album.on_spotify).to eq(true)
  end
end
