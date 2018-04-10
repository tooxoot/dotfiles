require 'net/http'
require 'json'

uri = URI('https://android.googleapis.com/gcm/send')
http = Net::HTTP.new(uri.host, uri.port)

headers = {
  'Content-Type' => 'application/json charset=UTF-8',
  'Authorization' => 'AIzaSyBmi1pfZwP2nbkFNU6DeS7w6NNGSvoKtG4'
}

req = Net::HTTP::Post.new(uri.path, headers)

req.body = {
  to: '',
  data: {head: 'HEAD_TEXT', body: 'BODY_TEXT' }
}.to_json

res = http.request(req)

puts "response #{res.body}"
