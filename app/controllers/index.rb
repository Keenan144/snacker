
get '/profile' do
  if session_current_user == nil
    redirect('/')
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
  if session_current_user == nil
    redirect('/')
  else
#return html form to create a new tweet
#can't create a new snack if you're not logged in.
    erb :new_snack
  end
end

post '/snack' do
  #create a new snack
  @snack = Tweet.create(content: params[:content], user_id: session[:current_user_id])
  if @snack.valid?
    redirect '/'
  else
    @valid = false
    erb :edit
  end
end

get '/snack/:id' do |id|
  if session_current_user == nil
    redirect('/')
  else
  #display a specific snack
    @snack = Tweet.find(id)

    erb :view_single_snack
  end
end

get "/follow/:handle" do
  @person = User.find_by(handle: params[:handle])
#if follow has already been created
  if Follow.where(follower_id: session[:current_user_id], followed_id: @person.id).count > 0
  erb :profile
  else
   Follow.create(follower_id: session[:current_user_id], followed_id: @person.id)
  erb :profile
  end
end


get '/snack/:id/edit' do |id|
  if session_current_user == nil
    redirect('/')
  else
    #return html form for editing snack
    @snack = Tweet.find(id)
    erb :edit
  end
end

put '/snack/:id' do
  #updates a specific snack
  @snack = Tweet.find(params[:id])
  @snack.update(params[:data])
  redirect '/'
end

delete '/snack/:id' do |id|
  if session_current_user == nil
    redirect('/')
  else
    #delete a snack
    @snack = Tweet.find(id)
    @snack.destroy
    redirect '/homepage'
    p "8"* 100
  end
end

get '/homepage' do
  @snacks = Tweet.all
  erb :homepage
end


