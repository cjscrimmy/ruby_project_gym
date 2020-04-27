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
end