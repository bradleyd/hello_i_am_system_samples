require "./whoami/*"
require "http/server"
require "http/client"
require "json"

module Whoami

server = HTTP::Server.new(8080) do |context|
  context.response.content_type = "application/json"
  response = HTTP::Client.get "http://ip-api.com/json"
  response.status_code      # => 200
  #response.body.lines.first # => "<!doctype html>"
  context.response.print response.body
end

puts "Listening on http://127.0.0.1:8080"
server.listen
end
