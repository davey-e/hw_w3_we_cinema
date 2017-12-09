require_relative('../db/sql_runner.rb')

class Film

  attr_reader :id
  attr_accessor :title, :price

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @title = options['title']
    @price = options['price'].to_i
  end

  #Create
  def save()
    sql = "INSERT INTO films(title, price)
    VALUES($1, $2)
    RETURNING id"
    values = [@title, @price]
    film = SqlRunner.run(sql, values).first
    @id = film['id'].to_i
  end

  #Read
  def Film.select_all()
    sql = "SELECT * from films"
    films = SqlRunner.run(sql)
    result = films.map{|film| Film.new(film)}
    return result
  end

  def customers()
    sql = "SELECT customers.* FROM customers
    INNER JOIN tickets
    ON customers.id = tickets.customer_id
    WHERE tickets.film_id = $1;"
    values = [@id]
    customer_hashes = SqlRunner.run(sql, values)
    customers = customer_hashes.map{|customer| Customer.new(customer)}
    return customers
  end

  #Update
  def update()
    sql= "UPDATE films SET (title, price) = ($1, $2)
    WHERE id = $3"
    values=[@title, @price, @id]
    SqlRunner.run(sql, values)
  end

  #Delete
  def Film.delete_all()
    sql = "DELETE from films"
    SqlRunner.run(sql)
  end

  def delete()
    sql = "DELETE FROM films
    WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

end
