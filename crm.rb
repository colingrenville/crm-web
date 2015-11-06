require_relative 'contact.rb'
require 'sinatra'
require 'data_mapper'

DataMapper.setup(:default, "sqlite3:database.sqlite3")

# Temporary fake data so that we always find contact with id 1000.

get '/' do
	@crm_app_name = "My CRM"
  	erb :index
end

get '/contacts' do
  	erb :contacts
end

get '/contacts/new' do
	erb :new_contact
end

get "/contacts/:id" do
  @contact = Contact.find(params[:id].to_i)
  if @contact
    erb :show_contact
  else
    raise Sinatra::NotFound
  end
end

get '/contacts/:id/edit' do
	@contact = Contact.find(params[:id].to_i)
	if @contact 
		erb :edit_contact
	else
		raise Sinatra::NotFound
	end
end

put '/contacts/:id' do
	@contact = Contact.find(params[:id].to_i)
  	if @contact 
	    @contact.first_name = params[:first_name]
	    @contact.last_name = params[:last_name]
	    @contact.email = params[:email]
	    @contact.notes = params[:notes]

		redirect to("/contacts")
	else
		raise Sinatra::NotFound
	end
end

post '/contacts' do
	Contact.create(params[:first_name], params[:last_name], params[:email], params[:notes])
	redirect to('/contacts')
end

delete '/contacts/:id' do
	@contact = Contact.find(params[:id].to_i)
	if @contact
		@contact.remove
		redirect to ("/contacts")
	else
		raise Sinatra::NotFound
	end
end