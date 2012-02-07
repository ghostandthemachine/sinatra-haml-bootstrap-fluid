
require 'sinatra'
require 'haml'


get '/' do
	haml :index
end

get '/about' do
	haml :about
end

get '/contact' do
	haml :about
end

get '/register' do
	haml :about
end

get '/login' do
	haml :about
end
