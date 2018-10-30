require 'sinatra'
require 'sinatra/reloader'
require 'yaml'
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
  player_role = params[:player_role]
  if player_role == 'breaker'
    params[:game].nil? ? game = Mastermind.new : game = YAML::load(params[:game])
    erb :mastermind, :locals => { :game => game, :player_role => player_role }
  else
    # when player is code master
    # if game.secret_code already exists, code is entered
    # else show the gameboard of computer guessing
  end
  
end
