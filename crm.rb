require 'sinatra'
require 'contact.rb'

get '/' do
	@crm_app_name = "My CRM"
  	erb :index
end