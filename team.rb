require 'sinatra'
require 'sinatra/reloader'

def randomiz(team_array, how_many, _method)
    team_array_rand = team_array.shuffle
    array_result = []
    team_count = 1
    slice = team_array_rand.each_slice(how_many).to_a
    for team in slice
        array_result << { team_count => team }
        team_count += 1
    end
    array_result
end

# print randomiz([1, 2, 3, 4, 5, 6], 2)

get '/' do
    erb :index
end

post '/' do
    puts params
    @people = params[:names].split(',')
    @method = params[:method] # radio button
    @how_many = params[:how_many].to_i # teams or people based on method
    $randomiz = randomiz(@people, @how_many, @method) # 2 will be the count split how_many
    redirect back
end
