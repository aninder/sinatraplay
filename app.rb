require 'sinatra'
require 'shotgun'
require 'haml'

configure do
  set :haml, {:format => :html5}
  enable :sessions
  set :sessions,
      :key          => 'SESSION_ID',
      :httponly     => true,
      :secure       => false,
      :expire_after => 60*60*24, # == one day
      :secret       => ENV['SESSION_SECRET'] || "changeme"
  use Rack::MethodOverride
# require 'rack-flash'
# use Rack::Flash

# register Sinatra::ConfigFile
# config_file 'config.yml'
# set :public_folder, "#{File.dirname(__FILE__)}/public"
# set :views, File.dirname(__FILE__) + '/views'

# before '/admin/*' do
# content_type :txt
# check logged in
# end

end

before do
  content_type 'application/json'
end

helpers do
end

get "/" do
  haml :home
end

__END__

@@ layout
%html
 %body
  =yield

@@ home
%p Hello Sinatra


