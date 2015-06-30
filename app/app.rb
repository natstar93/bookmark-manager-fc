require 'sinatra/base'
require './app/models/link'
require 'data_mapper'
require './app/data_mapper_setup.rb'

class App < Sinatra::Base
  get '/links' do
    @links = Link.all
    erb :index
  end

  post '/links' do
    link = Link.create(url: params[:url], title: params[:title])
    tag = Tag.create(name: params[:tag])
    link.tags << tag
    link.save
    redirect to('/links')
  end

  get '/links/new' do
    erb :new
  end

  get '/tags/:name' do
    tag = Tag.first(name: params[:name])
    @links = tag ? tag.links : []
    erb :index
  end
end
