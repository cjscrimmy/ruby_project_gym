require_relative("../db/sql_runner")

class Lesson
    attr_reader :id
    attr_accessor :lesson_name, :lesson_type

    def initialize(options)
        @id = options['id'] if options['id']
        @lesson_name = options['lesson_name']
        @lesson_type = options['lesson_type']
    end
end