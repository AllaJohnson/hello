# encoding: utf-8
require 'sinatra'
@@hit_counts = 0
def hit
@@hit_counts += 1
end
get '/' do
  hit
  erb :'index.html'
end  
get '/about' do 
  hit
  erb :'about.html'
end  
get '/contacts' do 
  hit 
  erb :'contacts.html'  
end
get '/products' do
  hit
  @products = [ "prod1",  "prod2",  "prod3",  "prod4",  "prod5" ]
  erb :'products.html'
end
