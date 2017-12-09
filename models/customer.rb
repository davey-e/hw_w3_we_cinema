require_relative('../db/sql_runner.rb')

class Customer

  attr_reader :id
  attr_accessor :name, :funds

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @funds = options['funds'].to_i
  end

  #Create
  def save()
    sql = "INSERT INTO customers (name, funds)
    VALUES($1, $2)
    RETURNING id"
    values = [@name, @funds]
    customer = SqlRunner.run(sql, values).first
    @id = customer['id'].to_i
  end

  #Read
  def Customer.select_all()
    sql = "SELECT * from customers"
    customers = SqlRunner.run(sql)
    result = customers.map{|customer| Customer.new(customer)}
    return result
  end

  def Customer.find_by_id(search_id)
    sql = "SELECT * FROM customers
    WHERE id = $1"
    values = [search_id]
    customer_hash = SqlRunner.run(sql,values).first()
    return customer = Customer.new(customer_hash)
  end

  def films()
    sql = "SELECT films.* FROM films
    INNER JOIN tickets
    ON films.id = tickets.film_id
    WHERE tickets.customer_id = $1"
    values = [@id]
    film_hashes = SqlRunner.run(sql, values)
    films = film_hashes.map{|film| Film.new(film)}
    return films
  end

  #Update
  def update()
    sql= "UPDATE customers SET (name, funds) = ($1, $2)
    WHERE id = $3"
    values=[@name, @funds, @id]
    SqlRunner.run(sql, values)
  end

  #Delete
  def Customer.delete_all()
    sql = "DELETE from customers"
    SqlRunner.run(sql)
  end

  def delete()
    sql = "DELETE FROM customers
    WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

end
