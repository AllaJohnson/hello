# encoding: utf-8
require 'sinatra'
require 'sqlite3'

@@db = SQLite3::Database.new( "hello.db" )
 
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

get '/products/:id' do 
   @product = @@products.values_at params[:id]  
   hit 
    erb :'products/show.html'  
end

get '/products' do
  hit
  erb :'products/index.html'
end
