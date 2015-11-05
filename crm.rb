require_relative 'contact.rb'
require 'sinatra'

# Temporary fake data so that we always find contact with id 1000.
Contact.create("Johnny", "Bravo", "johnny@bitmakerlabs.com", "Rockstar")
Contact.create("Colin", "Grenville", "colin@bitmakerlabs.com", "cool")
Contact.create("Niloc", "ellivnerg", "niloc@bitmakerlabs.com", "looc")

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

get '/contacts/:id' do
	@contact = Contact.find(params[:id].to_i)
  	erb :show_contact
end

post '/contacts' do
	Contact.create(params[:first_name], params[:last_name], params[:email], params[:notes])
	redirect to('/contacts')
end