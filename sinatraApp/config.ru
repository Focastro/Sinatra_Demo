# require "./server"
# run MyApp

require 'sinatra/base'
Dir.glob('./app/{helpers,controllers}/*.rb').each { |file| require file }

# map("/users") { run UsersController }
# map("/")        { run ApplicationController }

#run Rack::Cascade.new [UsersController, ApplicationController]
run Rack::URLMap.new({
  "/users" => UsersController,
  "/" => ApplicationController
})


#Esta es la configuracion de la base de datos
require 'data_mapper'
DataMapper.setup(:default, 'sqlite::memory:')

require './app'