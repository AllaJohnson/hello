class Product
  attr_accessor :id, :name, :cost, :category_id
       
  # def initialize( my_arg = {} )
  #        @name = initialize[:name]
  #        @cost = initialize[:cost]
  #        @category_id = initialize[:category_id]
  #        puts "my initialize method  #{my_arg}"
  #        puts "attr_accessor #{@name},#{@cost},#{@category_id}"
  #   end
  def initialize( name, cost, category_id )
              @name = name
              @cost = cost
              @category_id = category_id 
              puts "my initialize method  #{name}"
              puts "attr_accessor #{@name},#{@cost},#{@category_id}"
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
    # product = Product.new( :name => result["name"], :cost => result["cost"], :category_id => result["category_id"] )
    product = Product.new( result["name"], result["cost"], result["category_id"] )
    product.id = result["id"]
    puts "my_product: #{product.id}, #{product.name}, #{product.cost}, #{product.category_id}"
    product
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
  #   def self.delete
  #     q = "delete from products where id= #{params[:id]}"
  #      @@db.execute(q)
  #   end
end

  