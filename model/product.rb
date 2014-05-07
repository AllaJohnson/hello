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
end

  