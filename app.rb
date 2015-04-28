require('sinatra')
require('sinatra/reloader')
require('./lib/tamagotchi')
also_reload('/lib/**/*.rb')

get('/') do
  erb(:index)
end

post('/my_pet') do
  name = params.fetch('name')
  @a_pet = Tamagotchi.new(name)
  erb(:my_pet)
end
