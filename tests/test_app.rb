require "minitest/autorun"
require "rack/test"
require_relative "../app.rb"

class TestApp < Minitest::Test 
	include Rack::Test::Methods

	def app

		PersonalDetailsApp
	end

	def test_get_entry_page

		get '/'

		assert(last_response.ok?)
		assert(last_response.body.include?("Hello, what is your name?"))
		assert(last_response.body.include?('<input type="text" name="name">'))
		assert(last_response.body.include?('<form method="post" action="name">'))
	end

	def test_post_name

		post '/name', name: 'Max'
		follow_redirect!

		assert(last_response.ok?)
		assert(last_response.body.include?('Max'))
	end

	def test_get_age

		get '/age?user_name=Maxwell'

		assert(last_response.ok?)
		assert(last_response.body.include?("Hello Maxwell, what is your age?"))
	 	assert(last_response.body.include?('<input type="text" name="age">'))
	 	assert(last_response.body.include?('<form method="post" action="age?name=Maxwell">'))
	end

	def test_post_age

		post '/age', name: 'Maxwell', age: '20'
		follow_redirect!

		assert(last_response.ok?)
		assert(last_response.body.include?('Maxwell'))
		assert(last_response.body.include?('20'))
	end

	def test_get_location

		get '/location?user_name=Maxwell&user_age=20'

		assert(last_response.ok?)
		assert(last_response.body.include?('Maxwell, what is your location?'))
		assert(last_response.body.include?('<input type="text" name="location">'))
		assert(last_response.body.include?('<form method="post" action="location?user_name=Maxwell&amp;user_age=20">'))
	end

	def test_post_location

		post '/location', name: 'Maxwell', age: '20', location: 'Pittsburgh'

		assert(last_response.ok?)
	end
end