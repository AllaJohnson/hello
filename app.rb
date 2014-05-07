# encoding: utf-8
require 'sqlite3'
require 'json'
require 'sinatra'

# Initializing Sinatra::RespondTo 
require 'sinatra/respond_to'
Sinatra::Application.register Sinatra::RespondTo

# Require all *.rb files from /lib and /model folders
Dir["./lib/*.rb"].each {|file| require file }
Dir["./model/*.rb"].each {|file| require file }



# Createing database instance 
@@db = SQLite3::Database.new( "db/hello.db" )
@@db.results_as_hash = true


# Before filters are evaluated before each request 
before do
  hit # incrase hit counter
  log("request to page: #{request.path_info}") # Log request page
end

# HOME PAGE
get '/' do
  erb :index
end 

# ABOUT 
get '/about' do
  erb :about
end 
 
# CONTACTS 
get '/contacts' do 
  erb :contacts  
end


# PRODUCTS - INDEX
# GET - /products/  
get '/products' do
  # q = 'SELECT products.id AS id, 
  #               products.name AS name, 
  #               products.cost AS cost,
  #               categories.name AS category 
  #               FROM products 
  #       JOIN categories
  #       ON products.category_id = categories.id'

  # @products = @@db.execute(q)
  @products = Product.all

  respond_to do |wants| 
    wants.html { erb :'products/index' } 
    wants.json { @products.to_json } 
  end
end

# PRODUCTS - NEW
# GET - /products/new
get '/products/new' do
   @categories = @@db.execute('SELECT * FROM categories')
   erb :'products/new' 
end

# PRODUCTS - CREATE
# POST - /products
post '/products' do
  @product = @@db.execute( "insert into products values ( ?, '#{params['name']}', #{params['cost']}, #{params['category_id']} ) " )  

  respond_to do |wants| 
    wants.html { redirect '/products' } 
    wants.json { @product.to_json } 
  end
end

# PRODUCTS - SHOW
# GET - /products/1
get '/products/:id' do
  
  @product = @@db.execute( "select * from products where id= #{params[:id]}" ).first
  @categories = @@db.execute( "SELECT name FROM categories where id= #{@product['category_id']}" ).first
  respond_to do |wants| 
    wants.html { erb :'products/show' } 
    wants.json { @product.to_json } 
  end
end

# PRODUCTS - EDIT
# GET - /products/:id/edit
get '/products/:id/edit' do
  @product = @@db.execute( "select * from products where id= #{params[:id]}" ).first
  @categories = @@db.execute('SELECT * FROM categories')
  erb :'products/edit' 
end
      
# PRODUCTS - UPDATE
# PUT - /products/:id
put '/products/:id' do
  @product = @@db.execute( "update products set name = '#{params['name']}', cost= #{params['cost']}, category_id= #{params['category_id']} where id= #{params[:id]}" )
  log "MY_PARAMS #{params}"  
  redirect "/products"
end


# PRODUCTS - DELETE
# GET - /products/:id/destroy
delete '/products/:id' do
   @product = @@db.execute( "delete from products where id= #{params[:id]}" )
   redirect "/products"
end

