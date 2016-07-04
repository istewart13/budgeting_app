require_relative('../models/merchant.rb')

get '/merchants' do
  @merchants = Merchant.all
  erb(:'merchants/index')
end

get '/merchants/new' do
  erb(:'merchants/new')
end

post '/merchants' do 
  @merchant = Merchant.new(params)
  @merchant.save
  erb(:'merchants/create')
  # sleep 3
  # redirect to('/merchants') 
end

get "/merchants/:id" do
  @merchant = Merchant.find(params[:id])
  erb(:'merchants/show')
end

get "/merchants/:id/edit" do
  @merchant = Merchant.find(params[:id])
  erb(:'merchants/edit')
end

post "/merchants/:id" do
  @merchant = Merchant.update(params)
  redirect to("/merchants/#{params[:id]}")
end

# # POST "/merchants/3" - Deletes a specific merchant
# post "/merchants/:id/delete" do
#   # some code here
#   erb(:'merchants/delete')
# end