require 'sinatra'
require 'sinatra/reloader'
require_relative 'lib/mastermind/mastermind.rb'

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
  params[:game].nil? ? game = Mastermind.new : game = params[:game]
  player = params[:player]
  erb :mastermind, :locals => { :game => game, :player => player }
end
