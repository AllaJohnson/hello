# encoding: utf-8
require 'sinatra'
require 'sqlite3'
require 'json'
require 'sinatra/respond_with'
require "sinatra/json"
require 'sinatra/content_for'
# With Sinatra::RespondWith
 # get '/' do
   # respond_with :index, :name => 'example' do |format|
    # format.txt { 'just an example' }
    # format.json { json @products }  
  # end
# end

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
  @product = @@db.execute( "select * from products where id=#{params[:id]}" )
   hit 
    erb :'products/show.html'  
end

get '/products' do
  @products = @@db.execute( "select * from products" ) 
  respond_with 'products/index.html' do |format|
    format.json { json @products }
  end
  hit
 # erb :'products/index.html'
end
