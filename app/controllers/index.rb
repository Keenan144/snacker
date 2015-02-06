
get '/profile' do
  if session[:current_user_id] == nil
    "you're not logged in"
  else
    erb :profile
  end
end
#login page
get '/login' do
  erb :login
end

post '/login' do
 #finds user with that handle
  @user = User.find_by(handle: params[:handle])
 if @user != nil && @user.authenticate(params[:password])
      session_set_current_user(@user)
      #redirect to their profile page
      redirect('/profile')
  else
  erb :login
 end
end

#registration page
get '/register' do
  erb :register
end

post '/register' do
  @new_user = User.create(name: params[:name], handle: params[:handle], password: params[:password])
  if @new_user.valid?
      session_set_current_user(@new_user)
      redirect('/profile')
  else
    erb :register
  end
end
#create a new user with params from registration form
#redirect to home page or new profile page

#logout route

get '/logout' do
  #sets the current user id to nil
  # redirect to login page.
  session_logout_current_user
  redirect('/homepage')

end


get '/' do
  # goes to view /index.erb
  @snacks = Tweet.all #tweet.find_by(user_name/index)
  erb :index
end

get '/snack/new' do
#return html form to create a new tweet
  erb :new_snack
end

post '/snack' do
  #create a new snack
  @snack = Tweet.create(content: params[:content], user_id: session[:current_user_id])
  if @snack.valid?
    redirect '/'
  else
    erb :new_snack
  end
end

get '/snack/:id' do |id|
  #display a specific snack
  @snack = Tweet.find(id)

  erb :view_single_snack
end

get '/snack/:id/edit' do |id|
  #return html form for editing snack
  @snack = Tweet.find(id)
  erb :edit
end

put '/snack/:id' do
  #updates a specific snack
  @snack = Tweet.find(params[:id])
  @snack.update(params[:data])
  redirect '/'
end

delete '/snack/:id' do |id|
  #delete a snack
  @snack = Tweet.find(id)
  @snack.destroy
  redirect '/homepage'
  p "8"* 100
end

get '/homepage' do
  @snacks = Tweet.all
  erb :homepage
end


