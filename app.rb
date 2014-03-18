# encoding: utf-8
require 'sinatra'
  get '/' do
    erb :index
  end  

  get '/about' do
     erb :about
  end  

  get '/contacts' do
     erb :contacts  
  end
