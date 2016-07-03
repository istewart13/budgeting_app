require_relative('../models/transaction.rb')

# get '/transactions' do
#   @transactions = Transaction.all
#   erb(:'transactions/index')
# end

get '/transactions/new' do
  erb(:'transactions/new')
end