require_relative 'ar.rb'

# DELETING ROWS WITH ACTIVE RECORD

# Let's find a customer in our customers table.
#
# You will need to run the active_record_create.rb script
# first, otherwise this customer will not exist.

product3 = Product.where(:name => 'Product 3').first

# In the above statement we have to call .first to get a single
# customer object. Without the .first we will get a collection
# of objects. In this case it will likely be a collection of
# size 1.

puts product3.inspect

# Deleting the customer is as simple as calling .destroy

product3.destroy  unless product3.nil?

puts product3.inspect

# DANGER! The following commented command would delete *all* customers
# from the customers table.

# Product.destroy_all
