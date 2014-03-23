# encoding: utf-8
require 'sinatra'
@@hit_counts = 0
def hit
@@hit_counts += 1
end
prod = { "prod1" => "10 $", "prod2" => "13 $", "prod3" => "14 $", "prod4" => "18 $", "prod5" => "20 $" }
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
  @prods = [ { :name =>  "prod1", :cost => "10$", :kind => "bread"}, { :name =>  "prod2", :cost => "13$", :kind => "butter" }, { :name =>  "prod3", :cost => "1$", :kind => "shugar" }, { :name =>  "prod4", :cost => "3$", :kind => "cake" }, { :name =>  "prod5", :cost => "18$", :kind => "cheese" } ]
  erb :'products.html'
end
