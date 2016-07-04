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
  redirect to('/transactions')
end