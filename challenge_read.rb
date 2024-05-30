require_relative 'ar.rb'

number_of_products = Product.count

puts "There are #{number_of_products} in the products table."

class Product < ApplicationRecord
  # Columns in products table:
  # id: integer
  # name: string
  # price: decimal
  # stock: integer
  # created_at: datetime
  # updated_at: datetime
  #
  # Based on the columns, we can determine if there is an association with any other tables. For example:
  # - If there is a column like `category_id`, it might indicate an association with a `categories` table.
  # Validations
  validates :name, presence: true, uniqueness: true, length: { minimum: 3 }
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :stock, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
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

# Total number of products with a low stock quantity (less than 5 in stock)
low_stock_products = Product.where("stock < ?", 5).count
puts "Total number of products with low stock (less than 5): #{low_stock_products}"
