require './model/dm'
require 'sinatra'
require './helpers/sinatra'
require './helpers/helpers'
require 'haml'


configure do
  enable :sessions
end

get '/' do
  @user = session[:user]
  unless @user == nil
    @user_name = session[:user].user_name
  end
  haml :index
end

get '/user/:user_name/dashboard' do
  @user = User.first(user_name: params[:user_name])
  @user_name = session[:user].user_name
  haml :user_dashboard
end

get '/user' do
  redirect '/user/' + session[:user].user_name
end

get '/about' do
  unless session[:user] == nil
    @user_name = session[:user].user_name
  end
  haml :about
end

get '/contact' do
  haml :contact
end


get '/user/:user_name/profile' do
  @user = User.first(user_name: params[:user_name])
  unless session[:user] == nil
    @user_name = session[:user].user_name
  end
  haml :user_profile
end


get '/login' do
  haml :login
end

post '/login' do
  if session[:user] = User.authenticate(params["username"], params["password"])
    flash("Login successful")
    redirect "/user/" << session[:user].user_name << "/dashboard"
  else
    flash("Login failed - Try again")
    redirect '/login'
  end
end

get '/logout' do
  session[:user] = nil
  flash("Logout successful")
  redirect '/'
end

get '/list' do
  unless session[:user] == nil
    @user_name = session[:user].user_name
  end
  @users = User.all
  haml :list
end

get '/register' do
  haml :register
end

post '/register' do
  u = User.new
  u.user_name =   params[:user_name]
  u.password =    params[:password]
  u.email =       params[:email]
  
  if u.save
    flash("User created")
    session[:user] = User.authenticate( params["user_name"], 
                                        params["password"])
    redirect '/user/' << session[:user].user_name.to_s << "/dashboard"
  else
    tmp = []
    u.errors.each do |e|
      tmp << (e.join("<br/>"))
    end
    flash(tmp)
    redirect '/create'
  end
end

