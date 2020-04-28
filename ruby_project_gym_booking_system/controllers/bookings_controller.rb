require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('../models/booking')
also_reload( '../models/*' )

get '/bookings' do
    @bookings = Booking.all()
    erb(:"bookings/index")
end

get '/bookings/:id' do #show
    @booking = Booking.find_by_id(params['id'].to_i)
    erb(:"bookings/show")
end