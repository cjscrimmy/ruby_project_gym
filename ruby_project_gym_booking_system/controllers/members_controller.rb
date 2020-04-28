require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('../models/member')
also_reload( '../models/*' )

get '/members' do #index
    @members = Member.all()
    erb( :"members/index" )
end

#methods for adding a new member
get '/members/new' do #new
    erb(:"members/new")
end

post '/members' do #create
    @member = Member.new( params )
    @member.save()
    redirect to '/members'
end
#####

get '/members/:id' do #show
    @member = Member.find_by_id(params['id'].to_i)
    erb(:"members/show")
end

#methods for updating a members details
get '/members/:id/edit' do
    @member = Member.find_by_id(params['id'].to_i)
    erb(:"members/edit")
end

post '/members/:id' do
    member = Member.new(params)
    member.update()
    redirect to "/members/#{params['id']}"
end
#####