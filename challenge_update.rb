require_relative 'ar.rb'

# Find all products with a stock quantity greater than 40
products_with_high_stock_quantity = Product.where("stock_quantity > ?", 40)

# Iterate over each product and increment the stock_quantity quantity by 1
products_with_high_stock_quantity.each do |product|
  product.stock_quantity += 1
  product.save
end

# Output to confirm the changes
puts "Updated stock_quantity quantities for products with stock_quantity greater than 40:"
products_with_high_stock_quantity.each do |product|
  puts "#{product.name}: #{product.stock_quantity}"
end
