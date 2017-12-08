require('pry-byebug')
require_relative('./models/customer.rb')

customer1 = Customer.new({'name' => 'Dave Ellis', 'funds' => '50'})
customer1.save()


binding.pry
nil
