require_relative( '../models/customer' )
require_relative( '../models/film' )
require_relative( '../models/ticket' )

require ( 'pry-byebug' )

Ticket.delete_all()
Customer.delete_all()
Film.delete_all()

customer1 = Customer.new({ 'name' => 'Mark Kermode', 'funds' => 500 })
customer2 = Customer.new({ 'name' => 'Simon Mayo', 'funds' => 90 })
customer1.save()
customer2.save()

film1 = Film.new({ 'title' => 'Transformers 38', 'price' => 15 })
film2 = Film.new({ 'title' => 'Harry Potter and the Acid Trip', 'price' => 20 })
film1.save()
film2.save()

ticket1 = Ticket.new({ 'customer_id' => customer1.id, 'film_id' => film1.id })
ticket2 = Ticket.new({ 'customer_id' => customer1.id, 'film_id' => film2.id })
ticket3 = Ticket.new({ 'customer_id' => customer2.id, 'film_id' => film2.id })
ticket1.save()
ticket2.save()
ticket3.save()

binding.pry
nil