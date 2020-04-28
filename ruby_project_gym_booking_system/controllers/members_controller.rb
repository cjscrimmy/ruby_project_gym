require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('../models/member')
also_reload( '../models/*' )

get '/members' do
    @members = Member.all()
    erb( :"members/index" )
end

get '/members/new' do
    erb(:"members/new")
end

post '/members' do
    @member = Member.new( params )
    @member.save()
    redirect to '/members'
end

get '/members/:id' do
    @member = Member.find_by_id(params['id'].to_i)
    erb(:"members/show")
end