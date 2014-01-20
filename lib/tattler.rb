require 'net/http'

class Tattler
	def self.tell(endpoint, params)
		raise NoEndpointSpecified if endpoint.blank?
		uri = URI.parse(endpoint)
		http = Net::HTTP.new(uri.host, uri.port)
		request = Net::HTTP::Post.new(endpoint)
		request.add_field('Content-Type', 'application/json')
		http.request(request,params.to_json)
	end

	def self.acquire(endpoint, params={})
		uri = URI(endpoint)
		uri.query  = URI.encode_www_form(params)
		http = Net::HTTP.new(uri.host, uri.port)
		request = Net::HTTP::Get.new(uri.request_uri)
		http.request(request)		
	end

end