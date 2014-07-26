require 'rails_helper'

feature 'Start Color Changes', :type => :feature, js: true do
  before :each do
    visit '/'
    Queues::InMemory.empty
  end

  after(:all) { InMemory.empty }

  let(:queue) { Queues::InMemory }

  it 'should start off as a blank background' do
    expect(page.find('body')[:style]).to eq ''
  end

  it 'should change the color as soon as the button is clicked' do
    page.click_button 'Start'
    expect(page.find('body.activated')[:style]).to start_with 'background-color: rgb('
  end

  it 'should change the color every 3 seconds' do
    queue.enqueue Color.new 100, 90, 80
    queue.enqueue Color.new 90, 80, 70
    queue.enqueue Color.new 80, 70, 60
    page.click_button 'Start'
    expect(page.find('body.activated')[:style]).to eq 'background-color: rgb(100, 90, 80);'
    # Note: I usually have a rule against sleep statements in specs because they're unreliable...
    sleep 3
    expect(page.find('body.activated')[:style]).to eq 'background-color: rgb(90, 80, 70);'
    sleep 3
    expect(page.find('body.activated')[:style]).to eq 'background-color: rgb(80, 70, 60);'
  end

  it 'should use black background when colors have run out' do
    page.click_button 'Start'
    expect(page.find('body')[:style]).to eq 'background-color: rgb(0, 0, 0);'
  end
end
