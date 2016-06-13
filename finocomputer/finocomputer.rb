require 'sinatra'
require "sinatra/activerecord"
require 'sinatra/flash'

begin
  require "better_errors"

  configure :development do
    use BetterErrors::Middleware
    BetterErrors.application_root = __dir__
  end

rescue LoadError
  puts "Skipping better_errors in production"
end

autoload :Computer, settings.root + '/models/computer'
autoload :User, settings.root + '/models/user'

Dir[settings.root + '/controllers/*.rb'].each {|file| require file }
Dir[settings.root + '/helpers/*.rb'].each {|file| require file }

# Enable Sessions
enable :sessions
set :session_secret, ENV['SESSION_SECRET'] || ''





get '/' do
  p session
  session[:test] = 'hello'
  @computers = Computer.all.order(:price_cents => :asc).limit(2)
  erb :home
end

get '/about_us' do
  p session
  session[:test] = 'aboutus'
  erb :about_us
end
