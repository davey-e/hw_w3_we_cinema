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


end
