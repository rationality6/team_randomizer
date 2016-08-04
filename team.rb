require 'sinatra'
require 'sinatra/reloader'

# def initialize(array)
#     puts 'Odd number of member.' if array.length.odd?
#     team_array = array
# end

def randomiz(team_array, how_many)
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
    @people = params[:names].split(",")
    $randomiz = randomiz(@people, 4)
    redirect back
end
