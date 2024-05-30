require_relative 'ar.rb'

10.times do
  # Generate a new category
  category = Category.create(
    name: Faker::Commerce.department,
    description: Faker::Lorem.sentence
  )

  if category.persisted?
    puts "Created category: #{category.name}"

    # Generate 10 products for each category
    10.times do
      product = category.products.create(
        name: Faker::Commerce.product_name,
        description: Faker::Lorem.paragraph,
        price: Faker::Commerce.price(range: 0..100.0),
        stock: Faker::Number.between(from: 1, to: 100)
      )

      if product.persisted?
        puts "  Created product: #{product.name} in category: #{category.name}"
      else
        puts "  Failed to create product: #{product.errors.full_messages.join(", ")}"
      end
    end
  else
    puts "Failed to create category: #{category.errors.full_messages.join(", ")}"
  end
end
