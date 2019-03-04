require 'net/http'
require 'uri'

def get_uber_api

#convert curl to ruby to get Uber API
uri = URI.parse("https://api.uber.com/v1.2/estimates/price?start_latitude=37.7752315&start_longitude=-122.418075&end_latitude=37.7752415&end_longitude=-122.518075")
request = Net::HTTP::Get.new(uri)
request.content_type = "application/json"
request["Authorization"] = "Token jWm-xukg_AlHzWuOihGLW4E5hrhtBnnPudOyhqwq"
request["Accept-Language"] = "en_US"

req_options = {
  use_ssl: uri.scheme == "https",
}

response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
  http.request(request)
end

response.code
body = response.body
response = JSON.parse(body)
body = JSON.parse(body)

end
