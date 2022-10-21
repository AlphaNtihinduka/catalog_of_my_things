require_relative 'spec_helper'

describe Genre do
  it 'should be the instance object of Genre class' do
    genre = Genre.new('12 December 2021')
    expect(genre).to be_an_instance_of(Genre)
  end
end
