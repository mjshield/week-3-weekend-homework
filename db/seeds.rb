require_relative( '../models/customer' )
require_relative( '../models/film' )
require_relative( '../models/ticket' )

require ( 'pry-byebug' )


Customer.delete_all()

customer1 = Customer.new({ 'name' => 'Mark Kermode', 'funds' => 500 })
customer1.save()

film1 = Film.new({ 'title' => 'Transformers 38', 'price' => 15 })
film1.save()

binding.pry
nil