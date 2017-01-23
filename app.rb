require 'sinatra'

configure { set :server, :puma }

class App < Sinatra::Base
  get "/" do
    "Hoge"
  end
end