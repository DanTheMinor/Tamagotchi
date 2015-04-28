require('sinatra')
require('sinatra/reloader')
require('./lib/tamagotchi')
also_reload('/lib/**/*.rb')
require('pry')

get('/') do
  erb(:index)
end

post('/new_pet') do
  if params.has_key?('name')
    name = params.fetch('name')
    @a_pet = Tamagotchi.new(name)
    @a_pet.save()
  elsif params.has_key?('food')
    amount = params.fetch('food').to_f
    @a_pet = Tamagotchi.all()[0]
    @a_pet.feed_pet(amount)
    @a_pet.save()
  end
  erb(:new_pet)
end

get('/new_pet') do
  @a_pet = Tamagotchi.all()[0]
  @a_pet.update_pet()
  @a_pet.save()
  if @a_pet.is_alive?()
    erb(:new_pet)
  else
    Tamagotchi.clear()
    erb(:cemetary)
  end
end
