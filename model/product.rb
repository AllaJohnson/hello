class Product
  def self.all
    q = 'SELECT products.id AS id, 
                products.name AS name, 
                products.cost AS cost,
                categories.name AS category 
                FROM products 
        JOIN categories
        ON products.category_id = categories.id'
     @@db.execute(q)
  end  
  def self.find(id)
    q = 'SELECT products.id AS id, 
                products.name AS name, 
                products.cost AS cost,
                categories.name AS category 
                FROM products 
        JOIN categories
        ON products.category_id = categories.id'
     @@db.execute(q).first
  end
   def self.new
       
   end
   def self.create( name, cost, category_id )
        q = 'INSERT INTO products ( name, cost, category_id) values ( ?, ?, ?) '
         @@db.execute(q)
    end
  #   def self.update
  #     q = "update products set name = '#{params['name']}', cost= #{params['cost']}, category_id= #{params['category_id']} where id= #{params[:id]}"
  #      @@db.execute(q)
  #   end
  #   def self.delete
  #     q = "delete from products where id= #{params[:id]}"
  #      @@db.execute(q)
  #   end
end

  