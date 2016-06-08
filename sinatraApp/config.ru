# require "./server"
# run MyApp

require 'sinatra/base'
Dir.glob('./app/{helpers,controllers}/*.rb').each { |file| require file }

# map("/users") { run UsersController }
# map("/")        { run ApplicationController }

#run Rack::Cascade.new [ProductsController, UsersController, ApplicationController]
run Rack::URLMap.new({
  "/users" => UsersController,
  "/products" => ProductsController,
  "/" => ApplicationController
})
