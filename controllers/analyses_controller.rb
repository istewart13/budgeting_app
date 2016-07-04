require_relative('../models/analysis.rb')
require_relative('../models/transaction.rb')

get '/analyses' do
  @transactions = Transaction.all()
  @analysis = Analysis.new(@transactions)
  erb(:'analyses/index')
end

# post '/analyses' do 
#   erb(:'analyses/create')
#   # sleep 3
#   # redirect to('/merchants') 
# end

# get "/analyses/:tag_id" do
#   @merchant = Merchant.find(params[:id])
#   erb(:'merchants/show')
# end

# get "/analyses/:tag_id" do
#   @merchant = Merchant.find(params[:id])
#   erb(:'merchants/show')
# end