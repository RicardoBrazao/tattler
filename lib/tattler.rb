require 'net/http'

class Tattler
	def self.tell(endpoint, params = {})
		raise NoEndpointSpecified if endpoint.nil?
		uri = URI.parse(endpoint)
		http = Net::HTTP.new(uri.host, uri.port)
		request = Net::HTTP::Post.new(endpoint)
		request.add_field('Content-Type', 'application/json')
		request.body = params
		http.request(request)
	end
end