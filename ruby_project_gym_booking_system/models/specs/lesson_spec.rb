require("minitest/autorun")
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative("../lesson")

class TestLesson < MiniTest::Test
    def setup()
        options = {
            "id" => 1,
            "lesson_name" => "Step Aerobics",
            "lesson_type" => "Keep Fit",
            "day_of_lesson" => "Tuesday",
            "time_lesson_is_on" => "10 am",
            "week_number_lesson_is_on" => 13
        }
        @lesson = Lesson.new(options)
    end

    def test_lesson_name()
        result = @lesson.lesson_name()
        assert_equal("Step Aerobics", result)
    end

    def test_lesson_type()
        result = @lesson.lesson_type()
        assert_equal("Keep Fit", result)
    end

    def test_day_of_lesson()
        result = @lesson.day_of_lesson()
        assert_equal("Tuesday", result)
    end

    def test_time_lesson_is_on()
        result = @lesson.time_lesson_is_on()
        assert_equal("10 am", result)
    end

    def test_week_number_lesson_is_on()
        result = @lesson.week_number_lesson_is_on()
        assert_equal(13, result)
    end
end