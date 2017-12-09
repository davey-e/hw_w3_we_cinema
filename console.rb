require('pry-byebug')
require_relative('./models/customer.rb')
require_relative('./models/film.rb')
require_relative('./models/ticket.rb')

customer1 = Customer.new({'name' => 'Dave Ellis', 'funds' => '50'})
customer1.save()

film1 = Film.new({'title' => 'Star Wars: The Last Jedi', 'price' => '10'})
film1.save()

ticket1 = Ticket.new({'customer_id' => customer1.id, 'film_id' => film1.id})
ticket1.save()


binding.pry
nil
