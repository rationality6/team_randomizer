require 'sinatra'
require 'sinatra/reloader'

# def randomiz(team_array, method, how_many)
#     team_array_rand = team_array.shuffle
#     team_count = 1
#     array_result = []
#     # if (team_count < team_array.length) && team_count > 0
#         slice = team_array_rand.each_slice(how_many).to_a
#         for team in slice
#             array_result << team
#             team_count += 1
#         end
#     # else
#     #     "Number of teams must be between 1 and the number of members"
#     # end
# end
def randomiz(team_array, how_many, method)
    team_array_rand = team_array.shuffle
    team_count = 1
    slice = team_array_rand.each_slice(how_many).to_a
    for team in slice
        print "Team#{team_count}#{team} "
        team_count += 1
    end
end

get '/' do
    erb :index
end

post '/' do
    puts params
    @people = params[:names].split(",")
    @method = params[:method] #radio button
    @how_many = params[:how_many].to_i #teams or people based on method
    $randomiz = randomiz(@people, @how_many, @method) #2 will be the count split how_many
    redirect back
end
