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

#methods for updating booking
get '/bookings/:id/edit' do
    @booking = Booking.find_by_id(params['id'].to_i)
    @lessons = Lesson.all()
    @members = Member.all()
    erb(:"bookings/edit")
end

post '/bookings/:id' do
    booking = Booking.new(params)
    booking.update()
    redirect to "/bookings/#{params['id']}"
end

#####

#method for deleting a booking
post '/bookings/:id/delete' do
    booking = Booking.find_by_id(params['id'].to_i)
    booking.delete()
    redirect to '/bookings'
end
#####