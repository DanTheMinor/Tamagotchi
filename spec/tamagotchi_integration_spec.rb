require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exception, false)
require 'pry'

describe('The pet name path', {:type => :feature}) do
  it('creates a tamagotchi based on user input name') do
    visit('/')
    fill_in('name', :with => 'big dragon')
    click_button('Create Tamagotchi!')
    expect(page).to have_content('You created a big dragon Tamagotchi')
  end
end
