class Product
  attr_accessor :id, :name, :cost, :category_id
      
  def initialize( my_arg = {} )
    @id = my_arg["id"]
    @name = my_arg["name"]
    @cost = my_arg["cost"]
    @category_id = my_arg["category_id"]
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
  
  def self.find(id)
    q = "SELECT * FROM products where id = #{id}"
    result = @@db.execute(q).first 
    product = Product.new( result )
  end
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
    def self.delete(id)
            q = "delete from products where id= #{id}"
             @@db.execute(q)
          end
end

  