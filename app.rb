require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/favorite_things_ruby')
require('rspec')
require('pry')

get('/') do
  @list = Item.sort()
  erb(:list)
end

post('/') do
  name = params["name"]
  rank = params["rank"].to_i
  if Item.validation(name, rank.to_i)
    item = Item.new(name, rank)
    item.save()
    @list = Item.sort()
  else
    @list = Item.sort()
  end
  erb(:list)
end

get('/items/:id') do
  @id = params["id"]
  @item = Item.find(params[:id])
  erb(:item)
end

get('/edit/:id') do
  @item = Item.find(params[:id])
  updateName = params["updateName"]
  @item.name = updateName
  erb(:edit)
end
