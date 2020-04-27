require_relative("../db/sql_runner")

class Member
    attr_reader :id, :first_name, :last_name, :date_of_birth
    
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
end