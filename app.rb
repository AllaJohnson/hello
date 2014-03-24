# encoding: utf-8
require 'sinatra'

@@hit_counts = 0
def hit
@@hit_counts += 1
end

get '/' do
  @users = { :name =>  " Алла ", :age => "16", :sex => "ж" }
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
  @prods = [ 
    { :name =>  "Хлеб", :cost => "32 руб.", :kind => "Бородинский" }, 
    { :name =>  "Масло", :cost => "130 руб.", :kind => "Анкор" }, 
    { :name =>  "Сахар", :cost => "62 руб.", :kind => "Кусковой" },
    { :name =>  "Тортик", :cost => "630 руб.", :kind => "Нежность" }, 
    { :name =>  "Сыр", :cost => "560 руб.", :kind => "Камамбер" } 
    ]
  erb :'products.html'
end
