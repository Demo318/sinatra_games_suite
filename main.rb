require 'sinatra'
require 'sinatra/reloader'

get '/' do
  redirect to('/index')
end

get '/index' do
  erb :index
end

get '/mastermind' do
  erb :mastermind
end

post '/mastermind' do
  erb :mastermind
end
