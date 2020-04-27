require("minitest/autorun")
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative("../member")

class TestMember < MiniTest::Test

    def setup
        options = {"id" => 1, "first_name" => "Bill", "last_name" => "Murray",
        "date_of_birth" => "29/07/80"}

        @member = Member.new(options)
    end

    def test_first_name()
        result = @member.first_name()
        assert_equal("Bill", result)
    end

    def test_last_name()
        result = @member.last_name()
        assert_equal("Murray", result)
    end

    def test_date_of_birth()
        result = @member.date_of_birth()
        assert_equal("29/07/80", result)
    end
end