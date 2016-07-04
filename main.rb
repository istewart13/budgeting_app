require('sinatra')
require('sinatra/contrib/all')
require_relative('controllers/analyses_controller')
require_relative('controllers/merchants_controller')
require_relative('controllers/transactions_controller')
require_relative('controllers/tags_controller')

get '/' do
  erb :home
end