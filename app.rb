require 'sinatra'
require 'sinatra/reloader'

configure { set :server, :puma }

class App < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get "/" do
    "Hoge"
  end
end