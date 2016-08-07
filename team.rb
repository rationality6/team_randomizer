require 'sinatra'
require 'sinatra/reloader'

def randomiz(team_array, how_many, method)
    team_array_rand = team_array.shuffle
    array_result = []
    team_count = 1

    how_many = (team_array.length / Float(how_many)).ceil if method == 'teamcount'
    # how_many = team_array.length / how_many if method == 'teamcount'
    slice = team_array_rand.each_slice(how_many).to_a
    for team in slice
        array_result << { team_count => team }
        team_count += 1
    end
    array_result
end

def radio_numberpercount(i)
    if i == 'numberpercount'
        'checked'
    else
        ''
    end
end

def radio_teamcount(i)
    if i == 'teamcount'
        'checked'
    else
        ''
    end
end

# print randomiz([1, 2, 3, 4, 5, 6, 7, 8], 3, 'teamcount')

$randomiz = {}

get '/' do
    erb :index
end

post '/' do
    $get_people = params[:names].to_s
    @people = $get_people.split(',')
    @method = params[:method] # radio button
    @how_many = params[:how_many].to_i # teams or people based on method
    $randomiz = randomiz(@people, @how_many, @method) # 2 will be the count split how_many
    erb :index
end
