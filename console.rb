require('pry-byebug')
require_relative('./models/customer.rb')
require_relative('./models/film.rb')
require_relative('./models/ticket.rb')
require_relative('./models/screening.rb')


Ticket.delete_all()
Film.delete_all()
Customer.delete_all()

customer1 = Customer.new({'name' => 'Dave Ellis', 'funds' => '50'})
customer1.save()
customer2 = Customer.new({'name' => 'Craig Miller', 'funds' => '40'})
customer2.save()
customer3 = Customer.new({'name' => 'Andrew Brodie', 'funds' => '30'})
customer3.save()

film1 = Film.new({'title' => 'Star Wars: The Last Jedi', 'price' => '12'})
film1.save()
film2 = Film.new({'title' => 'Thor: Ragnarok', 'price' => '11'})
film2.save()
film3 = Film.new({'title' => 'Justice League', 'price' => '10'})
film3.save()

screening1 = Screening.new('film_id' => film1.id, 'screening_time' => '14:30')
screening1.save()
screening2 = Screening.new('film_id' => film1.id, 'screening_time' => '17:15')
screening2.save()
screening3 = Screening.new('film_id' => film2.id, 'screening_time' => '10:30')
screening3.save()
screening4 = Screening.new('film_id' => film2.id, 'screening_time' => '18:45')
screening4.save()
screening5 = Screening.new('film_id' => film3.id, 'screening_time' => '20:00')
screening5.save()


ticket1 = Ticket.new({'customer_id' => customer1.id, 'film_id' => film1.id, 'screening_id' => screening1.id})
ticket1.save()
ticket2 = Ticket.new({'customer_id' => customer2.id, 'film_id' => film2.id, 'screening_id' => screening3.id})
ticket2.save()
ticket3 = Ticket.new({'customer_id' => customer3.id, 'film_id' => film3.id, 'screening_id' => screening5.id})
ticket3.save()
ticket4 = Ticket.new({'customer_id' => customer1.id, 'film_id' => film2.id, 'screening_id' => screening4.id})
ticket4.save()
ticket5 = Ticket.new({'customer_id' => customer2.id, 'film_id' => film3.id, 'screening_id' => screening5.id})
ticket5.save()
ticket6 = Ticket.new({'customer_id' => customer3.id, 'film_id' => film1.id, 'screening_id' => screening2.id})
ticket6.save()
ticket7 = Ticket.new({'customer_id' => customer1.id, 'film_id' => film1.id, 'screening_id' => screening1.id})
ticket7.save()



binding.pry
nil
