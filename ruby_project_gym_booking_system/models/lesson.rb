require_relative("../db/sql_runner")

class Lesson
    attr_reader :id
    attr_accessor :lesson_name, :lesson_type, :day_of_lesson,
    :time_lesson_is_on

    def initialize(options)
        @id = options['id'] if options['id']
        @lesson_name = options['lesson_name']
        @lesson_type = options['lesson_type']
        @day_of_lesson = options['day_of_lesson']
        @time_lesson_is_on = options['time_lesson_is_on']
    end
end