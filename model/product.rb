class Product
  attr_accessor :id, :name, :cost, :category_id
      
  def initialize( args )
    @id = args["id"]
    @name = args["name"]
    @cost = args["cost"]
    @category_id = args["category_id"]
     puts "MY_INITIALIZE #{args}"
  end
  
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
  
  def self.find( id )
    q = "SELECT * FROM products where id = #{id}"
    result = @@db.execute(q).first
    return nil if result == nil 
    product = Product.new( result )
    
  end
  
  def self.create( args )
      q = "INSERT INTO products values ( ?, '#{args["name"]}', #{args["cost"]}, #{args["category_id"]} )"
      @@db.execute(q)

      last_id = @@db.last_insert_row_id
      return 'error' if last_id == 0

      Product.find(last_id)
  end
  
  def update( args )
    @name= args["name"]
    @cost= args["cost"]
    @category_id= args["category_id"]
    @@db.execute( "UPDATE products set name = '#{args["name"]}', cost = #{args["cost"]}, category_id = #{args["category_id"]} where id = #{self.id}" )
  end  
  
  # def save
  #               q = "INSERT INTO products values (?, '#{product.name}', #{product.cost}, #{product.category_id}"
  #      result = @@db.execute(q).first 
  #      product = Product.new( result )
  #    end
    
  
  # def self.persisted?(id)
  #     q = "SELECT * FROM products where id = #{id}"
  #     result = @@db.execute(q).first 
  #     if product = Product.new( result ) = true 
  #       product.update = @@db.execute( "UPDATE products set name = '#{product.name}', cost= #{product.cost}, category_id= #{product.category_id} where id=  #{id}")
  #     else
  #       product.new = @@db.execute( "INSERT INTO products values (?, '#{product.name}', #{product.cost}, #{product.category_id} ")
  #     end
  # end    
   # def self.new
   #        
   #    end
   # def self.create( name, cost, category_id )
   #         q = 'INSERT INTO products ( name, cost, category_id) values ( ?, ?, ?) '
   #          @@db.execute(q)
   #     end
  #   def self.update
  #     q = "update products set name = '#{params['name']}', cost= #{params['cost']}, category_id= #{params['category_id']} where id= #{params[:id]}"
  #      @@db.execute(q)
  #   end
    def destroy
            q = "delete from products where id= #{self.id}"
             @@db.execute(q)
    end
end

  