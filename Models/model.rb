class Products
  def Products.all
    @@products = @@execute( "SELECT * FROM products" )
  end  
end
@@products = Products.new
  