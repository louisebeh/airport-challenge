require 'weather.rb'

describe Weather do

  it 'can be sunny' do
    expect{weather(sunny)}
  end

  it 'can be stormy' do
    expect{weather(stormy)}
  end


end