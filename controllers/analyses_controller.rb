require_relative('../models/analysis.rb')
require_relative('../models/transaction.rb')
require('pry-byebug')

get '/analyses' do
  @transactions = Transaction.all()
  @analysis = Analysis.new(@transactions)
  erb(:'analyses/index')
end

post '/analyses' do 
  redirect to("/analyses/#{params[:tag_id]}")
end

get "/analyses/:tag_id" do
  'hello'
  # @transactions = Transaction.find(params[:tag_id])
  # @analysis = Analysis.new(@transactions)
  # erb(:'analyses/show')
end