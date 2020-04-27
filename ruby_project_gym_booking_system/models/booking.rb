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

    def update()
        sql = "UPDATE bookings
        SET
        (
            member_id,
            lesson_id
        )=
        (
            $1, $2
        )
        WHERE id = $3"
        values = [@member_id, @lesson_id, @id]
        SqlRunner.run(sql, values)
    end

    def delete()
        sql = "DELETE FROM bookings
        WHERE id = $1"
        values = [@id]
        SqlRunner.run(sql, values)
    end
end