require_relative 'ar.rb'

number_of_products = Product.count

puts "There are #{number_of_products} in the products table."

# column_names = Product.column_names
# puts column_names

class Product
  # Columns in products table:
  # id: integer
  # name: string
  # price: decimal
  # stock_quantity: integer
  # category_id: integer
  # created_at: datetime
  # updated_at: datetime
  #
  # Based on the columns, we can determine if there is an association with any other tables. For example:
  # - If there is a column like `category_id`, it might indicate an association with a `categories` table.
  # Validations
  validates :name, presence: true, uniqueness: true, length: { minimum: 3 }
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :stock_quantity, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end

# Find any product from the database
product = Product.first
puts product.inspect

# Total number of products
total_products = Product.count
puts "Total number of products: #{total_products}"

# Names of all products above $10 with names that begin with the letter C
products_above_10_with_c = Product.where("price > ? AND name LIKE ?", 10, 'C%').pluck(:name)
puts "Names of products above $10 with names beginning with C: #{products_above_10_with_c.join(', ')}"

# Total number of products with a low stock quantity (less than 5 in stock_quantity)
low_stock_quantity_products = Product.where("stock_quantity < ?", 5).count
puts "Total number of products with low stock_quantity (less than 5): #{low_stock_quantity_products}"


# Adding association to categories table

# Find any product with stock_quantity greater than 40
product = Product.where("stock_quantity > ?", 40).first

# Find the name of the category associated with this product
category_name = product.category.name
puts "The category name associated with the product is: #{category_name}"

# Find a specific category
category = Category.find_by(name: "Electronics")

# Use the category to build and persist a new product
new_product = category.product.build(name: "New Electronic Product", price: 99.99, stock_quantity: 50)

if new_product.save
  puts "New product saved successfully: #{new_product.inspect}"
else
  puts "Failed to save new product: #{new_product.errors.full_messages.join(", ")}"
end

# Find all products associated with this category and priced over $20
expensive_products = category.product.where("price > ?", 20)

# Output the names and prices of the expensive products
puts "Expensive products in the Electronics category:"
expensive_products.each do |product|
  puts "Product name: #{product.name}, Price: #{product.price}"
end
