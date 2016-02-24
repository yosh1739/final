require 'bundler/setup'
Bundler.require
require 'sinatra/reloader' if development?
require 'open-uri'
require 'sinatra/json'
require './models/bbs.rb'
require './image_uploader.rb'


get '/' do
 @contents = Item.order('id desc').all
 erb :index
end

post '/confirm' do
 @contents = Item.order('id desc').all
 erb :form
end

post '/new' do
  Item.create({
      title: params[:title],
      body: params[:body],
      good: 0,
      bad: 0
  })
 redirect '/'
 end

post '/detail/:id' do
     @contributions = Contribution.find(params[:id])
    erb :detail
end

post '/delete/:id' do
    Item.find(params[:id]).destroy
    redirect '/'
end

post '/good/:id' do
    @content = Item.find(params[:id])
    good = @content.good
    @content.update({
        good: good + 1
    })
    
    redirect '/'
end

post '/bad/:id' do
    @content = Item.find(params[:id])
    bad = @content.bad
    @content.update({
        bad: bad + 1
    })
    
    redirect '/'
end

post '/edit/:id' do
    @content = Item.find(params[:id])
    erb :edit
end

post '/renew/:id' do
    @content = Item.find(params[:id])
    @content.update({
        title: params[:title],
        body: params[:body],
        linkTitle: params[:linkTitle],
        url: params[:url]
    })

 redirect '/'
end
