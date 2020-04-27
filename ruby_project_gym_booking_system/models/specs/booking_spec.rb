require("minitest/autorun")
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../booking')

class TestBooking < MiniTest::Test

    def setup()
        options = {
            "id" => 1,
            "member_id" => 36,
            "lesson_id" => 61
        }

        @booking = Booking.new(options)
    end

    def test_member_id()
        result = @booking.member_id()
        assert_equal(36, result)
    end

    def test_lesson_id()
        result = @booking.lesson_id()
        assert_equal(61, result)
    end
end