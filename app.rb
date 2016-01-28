require 'sinatra'
require 'shotgun'
require 'haml'
require 'sprockets'

configure do
  set :haml, {:format => :html5}
  set :assets, Sprockets::Environment.new

  enable :sessions
  set :sessions,
      :key => 'SESSION_ID',
      :httponly => true,
      :secure => false,
      :expire_after => 60*60*24, # == one day
      :secret => ENV['SESSION_SECRET'] || "changeme"
  use Rack::MethodOverride

  Encoding.default_external = Encoding::UTF_8
  Encoding.default_internal = Encoding::UTF_8
  # require 'rack-flash'
  # use Rack::Flash

  # register Sinatra::ConfigFile
  # config_file 'config.yml'
  # set :public_folder, "#{File.dirname(__FILE__)}/public"
  # set :views, File.dirname(__FILE__) + '/views'

  # before '/admin/*' do
  # content_type :txt
  # check logged in
end

before do
  content_type 'html'
end
helpers do
end

# Configure sprockets
settings.assets.append_path "js"
settings.assets.append_path "css"
get "/js/:file.js" do
  content_type "application/javascript"
  settings.assets["#{params[:file]}.js"]
end
get "/css/:file.css" do
  content_type "text/css"
  settings.assets["#{params[:file]}.css"]
end

get "/" do
  haml :home
end

__END__

@@ layout
%html
 %head
  %script(type="text/javascript" src="js/application.js")
  %link{:href => "css/application.css", :rel => "stylesheet", :type => "text/css"}
 %body
  =yield

@@ home
%p.well Hello Sinatra