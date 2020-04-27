require_relative("../db/sql_runner")

class Member
    attr_reader :id, :first_name
    
    def initialize(options)
        @id = options["id"] if options["id"]
        @first_name = options["first_name"]
    end
end