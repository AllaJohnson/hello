# encoding: utf-8
require 'sinatra'

@@products = {
   "1" => { :name =>  "Хлеб", :cost => "30 руб.", :kind => "Бородинский" }, 
   "2" => { :name =>  "Масло", :cost => "130 руб.", :kind => "Анкор" }, 
   "3" => { :name =>  "Сахар", :cost => "62 руб.", :kind => "Кусковой" },
   "4" => { :name =>  "Тортик", :cost => "630 руб.", :kind => "Нежность" }, 
   "5" => { :name =>  "Сыр", :cost => "560 руб.", :kind => "Камамбер" } 
}
 
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
   
    @product = @@products[params[:id]]
    hit 
    erb :'products/show.html'  
end

get '/products' do
  hit
  erb :'products/index.html'
end
