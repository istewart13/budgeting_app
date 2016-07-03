require('pry-byebug')

require_relative('../models/merchant')
require_relative('../models/transaction')
require_relative('../models/tag')
require_relative( '../models/analysis' )

Merchant.delete_all()
Tag.delete_all()
# Transaction.delete_all()

merchant1 = Merchant.new({'name' => 'Tesco'})
merchant2 = Merchant.new({'name' => 'Argos'})
m1 = merchant1.save
m2 = merchant2.save

tag1 = Tag.new({'name' => 'Food'})
tag2 = Tag.new({'name' => 'Electrical'})
t1 = tag1.save
t2 = tag2.save

transaction1 = Transaction.new({'merchant_id' => m1.id, 'tag_id' => t1.id, 'value' => 80, 'transaction_date' => '2016-04-30', 'description' => 'Weekly food shop from Tesco'})
tr1 = transaction1.save

transaction2 = Transaction.new({'merchant_id' => m2.id, 'tag_id' => t2.id, 'value' => 40, 'transaction_date' => '2016-05-15', 'description' => 'Bought a lamp'})
tr2 = transaction2.save

transactions = Transaction.all()
analysis = Analysis.new(transactions)

# NEED TO REMOVE
binding.pry
nil
# NEED TO REMOVE