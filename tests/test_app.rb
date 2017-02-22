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
		
		assert(last_response.ok?)
	end
end