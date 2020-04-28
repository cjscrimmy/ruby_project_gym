require_relative("../db/sql_runner")
require_relative("./lesson")
require_relative("./booking")

class Member
    attr_reader :id
    attr_accessor :first_name, :last_name, :date_of_birth
    
    def initialize(options)
        @id = options['id'] if options['id']
        @first_name = options['first_name']
        @last_name = options['last_name']
        @date_of_birth = options['date_of_birth']
    end

    def pretty_name()
        return "#{@first_name} #{@last_name}"
    end

    def save()
        sql = "INSERT INTO members
        (
            first_name,
            last_name,
            date_of_birth
        )
        VALUES
        (
            $1, $2, $3
        )
        RETURNING *"
        values = [@first_name, @last_name, @date_of_birth]
        member_data = SqlRunner.run(sql, values)
        @id = member_data.first()['id'].to_i
    end

    def update()
        sql = "UPDATE members
        SET
        (
            first_name,
            last_name,
            date_of_birth
        )=
        (
            $1, $2, $3
        )
        WHERE id = $4"
        values = [@first_name, @last_name, @date_of_birth, @id]
        SqlRunner.run(sql, values)
    end

    def delete()
        sql = "DELETE FROM members
        WHERE id = $1"
        values = [@id]
        SqlRunner.run(sql, values)
    end

    def lessons()
        sql = "SELECT lessons.*
        FROM lessons
        INNER JOIN bookings
        ON bookings.lesson_id = lessons.id
        WHERE bookings.member_id = $1"
        values = [@id]
        lesson_data = SqlRunner.run(sql, values)
        return Lesson.map_items(lesson_data)
    end

    def self.delete_all()
        sql = "DELETE FROM members"
        SqlRunner.run(sql)
    end

    def self.all()
        sql = "SELECT * FROM members"
        member_data = SqlRunner.run(sql)
        return Member.map_items(member_data)
    end

    def self.find_by_id(id)
        sql = "SELECT * FROM members
        WHERE id = $1"
        values = [id]
        member = SqlRunner.run(sql, values)
        result = Member.new(member.first())
    end

    #Helper method for mapping 
    def self.map_items(member_data)
        result = member_data.map {|member| Member.new(member)}
        return result
    end
end