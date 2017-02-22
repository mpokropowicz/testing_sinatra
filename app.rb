require "sinatra"

class PersonalDetailsApp < Sinatra::Base

	get '/' do

		erb :name
	end

	post '/name' do

		name = params[:name]
		redirect '/age?user_name=' + name
	end

	get '/age' do

		name = params[:user_name]

		erb :age, :locals => {name: name}
	end
end