require('sinatra')
require('sinatra/reloader')
require('./lib/tamagotchi')
also_reload('/lib/**/*.rb')
require('pry')

get('/') do
  erb(:index)
end

post('/new_pet') do
  name = params.fetch('name')
  @a_pet = Tamagotchi.new(name)
  @a_pet.save()
  erb(:new_pet)
end

get('/new_pet') do
  @a_pet = Tamagotchi.all()[0]
  Tamagotchi.clear()
  @a_pet.update_pet()
  @a_pet.save()
  erb(:new_pet)
end
