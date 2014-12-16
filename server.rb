require 'pg'
require 'sinatra'

require_relative 'lib/chatitude.rb'

set :bind, '0.0.0.0'

get '/' do
  headers['Content-Type'] = 'application/json'
  send_file 'public/index.html'
end

post '/signup' do
  # params[:username][:password]
  headers['Content-Type'] = 'application/json'
  db = Chat::DB.connect_db
  username = params[:username]
  password = params[:password]
  new_user = Chat::DB.new_user(username,password,db)
  api_key = Chat::DB.find_api_key(new_user['id'], db)
  user_info = {'api_key' => api_key, 'username' => username}
end

post '/signin/' do
# params[:username][:password]
 headers['Content-Type'] = 'application/json' 
end

get '/chats' do
# id, username, time, message
  headers['Content-Type'] = 'application/json'
end

post '/chats' do
# api token message
  headers['Content-Type'] = 'application/json'
end

