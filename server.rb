require 'sinatra'
require_relative './lib/chatitude.rb'

get '/' do
  send_file 'public/index.html'

end

