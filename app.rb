# encoding: utf-8
require 'sinatra'
get '/' do  
  erb :'index.html'
end  
get '/about' do 
   erb :'about.html'
end  
get '/contacts' do  
   erb :'contacts.html'  
end
get '/products' do @products = [ "prod1",  "prod2",  "prod3",  "prod4",  "prod5" ]
  erb :'products.html'
end
