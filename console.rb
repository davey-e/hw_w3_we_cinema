require('pry-byebug')
require_relative('./models/customer.rb')
require_relative('./models/film.rb')

customer1 = Customer.new({'name' => 'Dave Ellis', 'funds' => '50'})
customer1.save()

film1 = Film.new({'title' => 'Star Wars: The Last Jedi', 'price' => '10'})
film1.save()


binding.pry
nil
