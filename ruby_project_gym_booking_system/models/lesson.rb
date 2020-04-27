require_relative("../db/sql_runner")

class Lesson
    attr_reader :id
    attr_accessor :lesson_name, :lesson_type, :day_of_lesson,
    :time_lesson_is_on, :week_number_lesson_is_on

    def initialize(options)
        @id = options['id'] if options['id']
        @lesson_name = options['lesson_name']
        @lesson_type = options['lesson_type']
        @day_of_lesson = options['day_of_lesson']
        @time_lesson_is_on = options['time_lesson_is_on']
        @week_number_lesson_is_on = options['week_number_lesson_is_on']
    end
    
    def save()
        sql = "INSERT INTO lessons
        (
            lesson_name,
            lesson_type,
            day_of_lesson,
            time_lesson_is_on,
            week_number_lesson_is_on
        )
        VALUES
        (
            $1, $2, $3, $4, $5 
        )
        RETURNING *"
        values = [@lesson_name, @lesson_type, @day_of_lesson, @time_lesson_is_on, @week_number_lesson_is_on]
        lesson_data = SqlRunner.run(sql, values)
        @id = lesson_data.first()['id'].to_i
    end

    def update()
        sql = "UPDATE lessons
        SET
        (
            lesson_name,
            lesson_type,
            day_of_lesson,
            time_lesson_is_on,
            week_number_lesson_is_on
        )= 
        (
            $1, $2, $3, $4, $5
        )
        WHERE id = $6"
        values = [@lesson_name, @lesson_type, @day_of_lesson, 
        @time_lesson_is_on, @week_number_lesson_is_on, @id]
        SqlRunner.run(sql, values)
    end

    def delete()
        sql = "DELETE FROM lessons
        WHERE id = $1"
        values = [@id]
        SqlRunner.run(sql, values)
    end
    
    def self.delete_all()
        sql = "DELETE FROM lessons"
        SqlRunner.run(sql)
    end

    def self.all()
        sql = "SELECT * FROM lessons"
        lesson_data = SqlRunner.run(sql)
        return Lesson.map_items(lesson_data)
    end

    def self.find_by_id(id)
        sql = "SELECT * FROM lessons
        WHERE id = $1"
        values = [id]
        lesson = SqlRunner.run(sql, values)
        result = Lesson.new(lesson.first())
        return result
    end

    #Helper method for mapping
    def self.map_items(lesson_data)
        result = lesson_data.map { |lesson| Lesson.new(lesson) }
        return result
    end
end