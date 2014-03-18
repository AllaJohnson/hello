# encoding: utf-8
require 'sinatra'
  get '/' do
    erb :'index.html', :layout 
  end  

  get '/about' do
     erb :'about.html'
     
  end  

  get '/contacts' do
     erb :'contacts.html'  
  end
