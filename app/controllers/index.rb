get '/' do
  # goes to view /index.erb
  @snacks = Tweet.all
  erb :index
end

get '/snack/new' do
#return html form to create a new tweet
  erb :new_snack
end

post '/snack' do
  #create a new snack
  @snack = Tweet.create(params[:data])
  redirect '/'
end

get '/snack/:id' do |id|
  #display a specific snack
  @snack = Tweet.find(id)

  erb :view_single_snack
end

get '/snack/:id/edit' do
  #return html form for editing snack
end

put '/snack/:id' do
  #updates a specific snack
  redirect '/'
end

delete '/snack/:id' do
  #delete a snack
  redirect '/'
end

get '/homepage' do

  erb :homepage
end


