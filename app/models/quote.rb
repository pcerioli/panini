class Quote

	require 'net/http'

	def self.random
		api = "http://www.iheartquotes.com/api/v1/random"
		Net::HTTP.get(URI.parse(api))
	end
		
end
