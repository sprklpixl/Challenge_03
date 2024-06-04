require_relative 'ar.rb'

# CREATING WITH ACTIVE RECORD

# There are three ways to create and persist a new product.
# Warning: If you run this script multiple times you will
# end up with duplicate entries in your products table.

# Method One: Create a product in "object space".

new_product = Product.new

# Set the required properties.

new_product.name  = "Product 1"
new_product.price = "10.99"
new_product.stock_quantity  = "100"

# Calling save on the object will persist it to the products table.

new_product.save

# We can call inspect on any object to inspect its internals.

puts new_product.inspect


# Method Two: Create an product in "object space"

# This time we set the required properties as key/value arguments of the new method.

product2 = Product.new( name:  "Product 2",
                        price: "23.99",
                        stock_quantity:  "27" )

# Like the previous example we need to call save to persist the object
# to the products table.

product2.save

# Method Three: Create the object and persist it all at once.

product3 = Product.create( name:  "Product 3",
                          price: "79.44",
                          stock_quantity:  "546" )

# Let's test the validations we added to the models/product.rb file:
# validates_presence_of :name, :price, :stock_quantity

product4 = Product.new( name: "Product 4" ) # Purposefully missing the city and email.

# Save will return false if any of our validations fail.
if (product4.save)
  puts "Product 4 was saved to the database products table."
  puts product4.inspect
else
  puts "There was an error saving Product 4 to the database."

  # We can loop through all the validation errors.
  product4.errors.messages.each do |column, errors|
    errors.each do |error|
      puts "The #{column} property #{error}."
    end
  end
end
