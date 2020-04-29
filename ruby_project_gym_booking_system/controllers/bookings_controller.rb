require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('../models/booking')
also_reload( '../models/*' )

get '/bookings' do
    @bookings = Booking.all()
    erb(:"bookings/index")
end

#methods for adding a new booking
get '/bookings/new' do #new
    @members = Member.all()
    @lessons = Lesson.all()
    erb(:"bookings/new")
end

post '/bookings' do #create
    @booking = Booking.new( params )
    @booking.save()
    redirect to '/bookings'
end
#####

get '/bookings/:id' do #show
    @booking = Booking.find_by_id(params['id'].to_i)
    erb(:"bookings/show")
end