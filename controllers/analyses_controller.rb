require_relative('../models/analysis.rb')
require_relative('../models/transaction.rb')
require('pry-byebug')
require('json')

get '/analyses' do
  @transactions = Transaction.all()
  @analysis = Analysis.new(@transactions)
  erb(:'analyses/index')
end

post '/analyses' do 
  redirect to("/analyses/#{params[:tag_id]}")
end

get '/analyses/:tag_id' do
  @transactions = Transaction.find_tag(params[:tag_id])
  @analysis = Analysis.new(@transactions)
  erb(:'analyses/show')
end

post '/merchant' do 
  redirect to("/merchant/#{params[:merchant_id]}")
end

get '/merchant/:merchant_id' do
  @transactions = Transaction.find_merchant(params[:merchant_id])
  @analysis = Analysis.new(@transactions)
  erb(:'analyses/show')
end

post '/value' do 
  redirect to("/value/#{params[:value]}")
end

get '/value/:value' do
  @transactions = Transaction.find_values(params[:value])
  @analysis = Analysis.new(@transactions)
  erb(:'analyses/show')
end

post '/date' do 
  redirect to("/date/#{params[:transaction_date1]}/#{params[:transaction_date2]}")
end

get '/date/:transaction_date1/:transaction_date2' do
  @transactions = Transaction.find_dates(params[:transaction_date1].to_s, params[:transaction_date2].to_s)
  @analysis = Analysis.new(@transactions)
  erb(:'analyses/show')
end

post '/description' do 
  redirect to("/description/#{params[:description]}")
end

get '/description/:description' do
  @transactions = Transaction.find_description(params[:description])
  @analysis = Analysis.new(@transactions)
  erb(:'analyses/show')
end

get '/json' do 
  content_type(:json)
  @transactions = Transaction.all()
  results = @transactions
  return JSON.pretty_generate(results)
end

get '/json/download' do 
  content_type(:json)
  @transactions = Transaction.all()
  results = @transactions
  File.open("transactions.json","w") { |file|
    file.write(JSON.pretty_generate(results)) } 
    content_type(:html)
    erb(:'analyses/create') 
end