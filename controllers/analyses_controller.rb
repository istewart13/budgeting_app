require_relative('../models/analysis.rb')
require_relative('../models/transaction.rb')
require('pry-byebug')
require('json')
require('pp')

get '/analyses' do
  @transactions = Transaction.all()
  @analysis = Analysis.new(@transactions)
  erb(:'analyses/index')
end

post '/analyses' do 
  redirect to("/analyses/#{params[:tag_id]}")
end

get "/analyses/:tag_id" do
  @transactions = Transaction.find_tag(params[:tag_id])
  @analysis = Analysis.new(@transactions)
  erb(:'analyses/show')
end

get '/all' do 
  content_type(:json)
  @transactions = Transaction.all()
  results = @transactions
  return JSON.pretty_generate(results)
end