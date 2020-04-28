require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('../models/lesson')
also_reload( '../models/*' )

get "/lessons" do #index
    @lessons = Lesson.all()
    erb(:"lessons/index")
end

get "/lessons/:id" do #show
    @lesson = Lesson.find_by_id(params['id'].to_i)
    erb(:"lessons/show")
end