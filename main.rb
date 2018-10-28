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
  params[:game].nil? ? game = Mastermind.new : game = YAML::load(params[:game])
  is_game = params[:game].nil?
  player = params[:player]
  erb :mastermind, :locals => { :game => game, :is_game => is_game, :secret_code => game.secret_code, :player => player }
end
