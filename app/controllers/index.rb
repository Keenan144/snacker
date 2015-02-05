<<<<<<< HEAD
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
#validates params from forms
#if valid
  #set the current_user to user_id with sessions
  #redirect to that users profile page
#else
  #post the login page again
  #with error message
end

#registration page
get '/register' do
  erb :register
end

post '/register' do
  @new_user = User.create(name: params[:name], handle: params[:handle], password: params[:password])
  session_set_current_user(@new_user)
  redirect('/profile')
end
#create a new user with params from registration form
#
#redirect to home page or new profile page


#logout route

get '/logout' do
  #sets the current user id to nil
  # redirect to login page.
  session_logout_current_user
  redirect('/login')

end

=======
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


>>>>>>> 3805346a344343cab484c91afcb0f0c3dec6097f
