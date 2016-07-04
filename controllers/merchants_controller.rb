require_relative('../models/merchant.rb')
require('pry-byebug')

get '/merchants' do
  @merchants = Merchant.all
  erb(:'merchants/index')
end

get '/merchants/new' do
  erb(:'merchants/new')
end

post '/merchants' do 
  # create pizza object

  # save to db
  erb(:'merchants/create')
end