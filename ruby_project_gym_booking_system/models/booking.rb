require_relative('../db/sql_runner')

class Booking

    attr_reader :id
    attr_accessor :member_id, :lesson_id

    def initialize(options)
        @id = options['id'] if options['id']
        @member_id = options['member_id']
        @lesson_id = options['lesson_id']
    end

    def save()
        sql = "INSERT INTO bookings
        (
            member_id,
            lesson_id
        )
        VALUES
        (
            $1, $2
        )
        RETURNING *"
        values = [@member_id, @lesson_id]
        booking_data = SqlRunner.run(sql, values)
        @id = booking_data.first()['id'].to_i
    end
end