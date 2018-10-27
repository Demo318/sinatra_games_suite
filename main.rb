require 'sinatra'
require 'sinatra/reloader'
require 'json'

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
