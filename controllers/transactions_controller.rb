require_relative('../models/transaction.rb')

get '/transactions' do
  @transactions = Transaction.all
  erb(:'transactions/index')
end

get '/transactions/new' do
  @merchants = Merchant.all()
  @tags = Tag.all()
  erb(:'transactions/new')
end

post '/transactions' do
  @transaction = Transaction.new(params)
  @transaction.save
  erb(:'transactions/create')
  # sleep 3
  # redirect to('/transactions')
end

get "/transactions/:id" do
  @transaction = Transaction.find(params[:id])
  erb(:'transactions/show')
end

# get "/transactions/:id/edit" do
#   @transaction = Transaction.find(params[:id])
#   erb(:'transactions/edit')
# end

# post "/transactions/:id" do
#   @transaction = Transaction.update(params)
#   redirect to("/transactions/#{params[:id]}")
# end

# post "/transactions/:id/delete" do
#   Transaction.delete(params[:id])
#   redirect to('/transactions')
# end