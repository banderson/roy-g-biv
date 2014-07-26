require 'rails_helper'

describe Color, :type => :model do
  it 'should default to black' do
    color = Color.new
    expect(color.r).to eql 0
    expect(color.g).to eql 0
    expect(color.b).to eql 0
  end

  it 'should accept r,g,b as args' do
    color = Color.new 255
    expect(color.r).to eql 255
    expect(color.g).to eql 0
    expect(color.b).to eql 0
    color = Color.new 255, 100
    expect(color.r).to eql 255
    expect(color.g).to eql 100
    expect(color.b).to eql 0
    color = Color.new 255, 0, 100
    expect(color.r).to eql 255
    expect(color.g).to eql 0
    expect(color.b).to eql 100
  end

  it 'should allow random creation of colors' do
    allow(Color).to receive(:get_random_number).and_return 100,200,255
    color = Color.get_random
    expect(color.r).to eql 100
    expect(color.g).to eql 200
    expect(color.b).to eql 255
  end
end
