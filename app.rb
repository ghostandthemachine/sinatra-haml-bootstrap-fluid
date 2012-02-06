
require 'sinatra'
require 'haml'


get '/' do
	haml :index
end

get '/about' do
	haml :about
end

get '/contact' do
	haml :contact
end

get '/login' do
	haml :login
end

