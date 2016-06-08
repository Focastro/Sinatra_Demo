class UsersController < ApplicationController
  get '/' do
    title "Usuarios"
    erb :users
  end

  get '/:number' do
    title "Usuario #{params[:number]}"
    erb :users
  end
end
