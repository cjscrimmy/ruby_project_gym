require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('../models/lesson')
also_reload( '../models/*' )

get "/lessons" do #index
    @lessons = Lesson.all()
    erb(:"lessons/index")
end

#methods for adding a new lesson
get "/lessons/new" do #new
    erb(:"lessons/new")
end

post "/lessons" do #create
    @lesson = Lesson.new( params )
    @lesson.save()
    redirect to "/lessons"
end
#####

#methods for updating lesson's details
get "/lessons/:id/edit" do
    @lesson = Lesson.find_by_id(params['id'].to_i)
    erb(:"lessons/edit")
end

post "/lessons/:id" do
    lesson = Lesson.new(params)
    lesson.update()
    redirect to "/lessons/#{params['id']}"
end
#####

get "/lessons/:id" do #show
    @lesson = Lesson.find_by_id(params['id'].to_i)
    erb(:"lessons/show")
end

#method for deleting a lesson
post "/lessons/:id/delete" do
    lesson = Lesson.find_by_id(params['id'].to_i)
    lesson.delete()
    redirect to "/lessons"
end
#####