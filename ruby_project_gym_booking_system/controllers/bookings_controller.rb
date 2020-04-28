require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('../models/booking')
also_reload( '../models/*' )

get '/bookings' do
    @bookings = Booking.all()
    erb(:"bookings/index")
end