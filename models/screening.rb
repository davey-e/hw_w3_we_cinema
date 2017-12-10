require_relative('../db/sql_runner.rb')

class Screening

  attr_reader :id
  attr_accessor :film_id, :screening_time

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @film_id = options['film_id'].to_i
    @screening_time = options['screening_time']
  end

  #Create
  def save()
    sql = "INSERT INTO screenings (film_id, screening_time)
    VALUES ($1, $2)
    RETURNING id"
    values = [@film_id, @screening_time]
    screening = SqlRunner.run(sql, values).first()
    @id = screening['id'].to_i
  end

  #Read
  def Screening.select_all()
    sql = "SELECT * from screenings"
    screenings = SqlRunner.run(sql)
    result = screenings.map{|screening| Screening.new(screening)}
    return result
  end

  #Update
  def update()
    sql= "UPDATE screenings SET (film_id, screening_time) = ($1, $2)
    WHERE id = $3"
    values=[@film_id, @screening_time, @id]
    SqlRunner.run(sql, values)
  end

  #Delete
  def Screening.delete_all()
    sql = "DELETE from screenings"
    SqlRunner.run(sql)
  end

  def delete()
    sql = "DELETE FROM screenings
    WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end


end
