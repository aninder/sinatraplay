require 'bundler'
Bundler.require

configure do
  set :public_folder, "#{File.dirname(__FILE__)}/public"
  set :views, File.dirname(__FILE__) + '/views'
  set :haml, {:format => :html5}
  enable :sessions
  set :session_secret, ENV['SESSION_KEY'] || 'change_me'
# register Sinatra::ConfigFile
# config_file 'config.yml'
end

before do
  content_type :txt
end

helpers do
end

get "/" do
  "hello sinatra"
end

