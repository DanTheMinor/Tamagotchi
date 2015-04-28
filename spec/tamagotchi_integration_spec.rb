require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exception, false)
require 'pry'

describe('The tasks path', {:type => :feature}) do
  it('') do
  end
end
