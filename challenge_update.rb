require_relative 'ar.rb'

# Find all products with a stock quantity greater than 40
products_with_high_stock = Product.where("stock > ?", 40)

# Iterate over each product and increment the stock quantity by 1
products_with_high_stock.each do |product|
  product.stock += 1
  product.save
end

# Output to confirm the changes
puts "Updated stock quantities for products with stock greater than 40:"
products_with_high_stock.each do |product|
  puts "#{product.name}: #{product.stock}"
end
