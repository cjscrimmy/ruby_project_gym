require_relative('../db/sql_runner')

class Booking

    attr_reader :id
    attr_accessor :member_id

    def initialize(options)
        @id = options['id'] if options['id']
        @member_id = options['member_id']
    end
end