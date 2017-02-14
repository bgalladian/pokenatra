require 'sinatra'
require 'sinatra/reloader'
require 'pry'
require 'active_record'
require 'pg'

require_relative "db/connection"
require_relative "models/pokemon"


get '/pokemons' do
  @pokemons = Pokemon.all
    erb :"index"
end

get '/pokemons/new' do
  erb :"new"
end

post '/pokemons' do
  @pokemon = Pokemon.create(params[:pokemon])
  redirect "/pokemons/#{@pokemon.id}"
end


get '/pokemons/:id' do
  @pokemon = Pokemon.find(params[:id])
  erb :"show"
end

get '/pokemons/:id/update' do
  @pokemon = Pokemon.find(params[:id])
  erb :"update"
end

put '/pokemons/:id' do
  @pokemon = Pokemon.find(params[:id])
  @pokemon.update(params[:pokemon])
  redirect "/pokemons/#{@pokemon.id}"
end

delete '/pokemons/:id' do
  @pokemon = Pokemon.find(params[:id])
  @pokemon.destroy
  redirect "/pokemons"
end

get '/' do
  redirect "/pokemons"
end
