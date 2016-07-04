require_relative('../models/analysis.rb')
require_relative('../models/transaction.rb')

get '/analyses' do
  @transactions = Transaction.all()
  @analysis = Analysis.new(@transactions)
  erb(:'analyses/index')
end