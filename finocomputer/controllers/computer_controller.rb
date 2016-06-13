

get '/computers' do
  @computers = Computer.all
  erb :'computers/index'
end


get '/computers/new' do
  @computer = Computer.new
  if request.xhr?
    erb :'computers/_form', :layout => false, :locals => {:computer => @computer }
  else
    erb :'computers/new'
  end
end


get '/computers/:id' do
  id = params[:id]
  @computer = Computer.find(id)
  erb :'computers/show'
end

get '/computers/:id/edit' do
  id = params[:id]
  @computer = Computer.find(id)
  erb :'computers/edit'
end

post '/computers/:id' do
  id = params[:id]
  @computer = Computer.find(id)

  # Using params helper
  @computer.assign_attributes(params_whitelist [:name, :price_cents, :modelo])

  if @computer.save
    flash[:message] = 'Computer Saved!'
    redirect "/computers/#{@Computer.id}"
  else
    erb :'computers/edit'
  end
end

post '/computers' do
  @computer = Computer.new
  # Using params helper
  @computer.assign_attributes(params_whitelist [:name, :price_cents, :modelo])

  if @computer.save

    if request.xhr?
      erb :'computers/_item', :layout => false, :locals => {:computer => @computer }
    else
      flash[:message] = 'Computer Added!'
      redirect "/computers/#{@computer.id}"
    end
  else
    if request.xhr?
      halt 400, erb(:'computers/_form', :layout => false, :locals => {:computer => @computer })
    else
      erb :'computers/new'
    end
  end
end

post '/computers/:id/delete' do
  id = params[:id]
  @computer = Computer.find(id)
  flash[:message]= "#{@computer.name} Deleted!"
  @computer.destroy
  redirect "/computers"
end


