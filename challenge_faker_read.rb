require_relative 'ar.rb'

# Fetch all categories
categories = Category.all

# Display category names and their associated products
categories.each do |category|
  puts "Category: #{category.name}"

  # Fetch the products associated with the category
  products = category.products

  # Display the product names and prices
  if products.any?
    products.each do |product|
      puts "  Product: #{product.name}, Price: $#{'%.2f' % product.price}"
    end
  else
    puts "  No products found for this category."
  end

  puts "-" * 30  # Separator for better readability
end
