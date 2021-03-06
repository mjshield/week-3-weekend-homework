require_relative( '../db/sql_runner' )

class Customer

  attr_reader :id
  attr_accessor :name, :funds

  def initialize ( options )
    @id = options['id'].to_i
    @name = options['name']
    @funds = options['funds'].to_i
  end

  def save()
    sql = "INSERT INTO customers (name, funds) VALUES ('#{@name}', #{@funds})
      RETURNING id"
    customer = SqlRunner.run(sql).first
    @id = customer['id'].to_i
  end

  def films()
    sql = "SELECT films.* FROM films
      INNER JOIN tickets 
      ON tickets.film_id = films.id
      WHERE customer_id = #{@id}"
    return Film.map_items(sql)
  end

  def tickets()
    sql = "SELECT * FROM tickets
      WHERE customer_id = #{@id}"
    tickets = Film.map_items(sql).length
    return tickets
  end
  #"There's a better way to return the number, via the SQL"

  def self.all()
    sql = "SELECT * FROM customers"
    return self.map_items(sql)
  end

  def self.delete_all()
    sql = "DELETE FROM customers"
    SqlRunner.run(sql)
  end

  def self.map_items(sql)
    customers = SqlRunner.run(sql)
    result = customers.map { |customer| Customer.new(customer) }
    return result
  end


end