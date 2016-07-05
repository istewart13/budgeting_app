require('sinatra')
require('sinatra/contrib/all')
require('./db/seeds.rb')


require_relative('controllers/analyses_controller')
require_relative('controllers/merchants_controller')
require_relative('controllers/transactions_controller')
require_relative('controllers/tags_controller')

use Rack::Auth::Basic, "Restricted Area" do |username, password|
  username == 'iain' and password == 'password'
end

get '/' do
  erb :home
end