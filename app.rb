require 'sinatra'
require 'sinatra/reloader'
require 'json'
require 'net/http'
require 'uri'

configure { set :server, :puma }

class App < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get "/" do
  end

  get "/callback" do
    if "subscribe" == params["hub.mode"] && ENV["VERIFY_TOKEN"] == params["hub.verify_token"]
      params["hub.challenge"]
    end
  end

  post "/callback" do
    json = JSON.parse request.body.read
    if "page" == json["object"]
      json["entry"].each do |entry|
        entry["messaging"].each do |message|
          sender_id = message["sender"]["id"]
          recieve_text = message["message"]["text"]
          send_message sender_id, recieve_text
        end
      end
    end
    ""
  end

  def send_message sender_id, message
    uri = URI.parse("https://graph.facebook.com/v2.6/me/messages?access_token=#{ENV["API_TOKEN"]}")
    https = Net::HTTP.new(uri.host, uri.port)
    https.use_ssl = true
    req = Net::HTTP::Post.new(uri.request_uri)

    req["Content-Type"] = "application/json"
    payload = { recipient: { id: sender_id }, message: { text: message } }.to_json
    req.body = payload
    https.request(req)
  end
end