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

		erb :age, :locals => {:name => name}
	end

	post '/age' do 

		name = params[:name]
		age = params[:age]

		redirect "/location?user_name=#{name}&user_age=#{age}"
	end

	get '/location' do

		name = params[:user_name]
		age = params[:user_age]

		erb :location,  :locals => {:name => name, :age => age}
	end

	post '/location' do

		name = params[:user_name]
		age = params[:user_age]
		location = params[:location]

		redirect "/numbers?user_name=#{name}&user_age=#{age}&user_location=#{location}"
	end

	get '/numbers' do 

		name = params[:user_name]
		age = params[:user_age]
		location = params[:user_location]

		erb :numbers, :locals => {:name => name, :age => age, :location => location}
	end
end