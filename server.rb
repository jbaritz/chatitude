require 'pg'
require 'sinatra'
require_relative 'lib/chatitude.rb'

set :bind, '0.0.0.0'

get '/' do
  send_file 'public/index.html'
end

post '/signup' do
  # params[:username][:password]
  db = Chat::DB.connect_db
  username = params[:username]
  password = params[:password]
  new_user = Chat::DB.new_user(username,password,db)
  api_key = Chat::DB.find_api_key(new_user['id'], db)
  localStorage.setItem('apiKey', api_key)
  redirect to '/'
end

post '/signin/' do
# params[:username][:password]
end

get '/chats' do
# id, username, time, message
end

post '/chats' do
# api token message


end