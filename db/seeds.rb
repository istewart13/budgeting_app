require('pry-byebug')

require_relative('../models/merchant')
require_relative('../models/transaction')
require_relative('../models/tag')
require_relative( '../models/analysis' )

Merchant.delete_all()
Tag.delete_all()
Transaction.delete_all()

merchant1 = Merchant.new({'name' => 'Tesco'})
merchant2 = Merchant.new({'name' => 'Argos'})
merchant3 = Merchant.new({'name' => 'Amazon'})
merchant4 = Merchant.new({'name' => 'Cineworld'})
merchant5 = Merchant.new({'name' => 'BP Garage'})
merchant6 = Merchant.new({'name' => 'Boots'})
merchant7 = Merchant.new({'name' => 'Student Loans Company'})
merchant8 = Merchant.new({'name' => 'Scottish Power'})
merchant9 = Merchant.new({'name' => 'Easyjet'})
merchant10 = Merchant.new({'name' => 'Asda'})
m1 = merchant1.save
m2 = merchant2.save
m3 = merchant3.save
m4 = merchant4.save
m5 = merchant5.save
m6 = merchant6.save
m7 = merchant7.save
m8 = merchant8.save
m9 = merchant9.save
m10 = merchant10.save

tag1 = Tag.new({'name' => 'Personal Care'})
tag2 = Tag.new({'name' => 'Health & Fitness'})
tag3 = Tag.new({'name' => 'Entertainment'})
tag4 = Tag.new({'name' => 'Education'})
tag5 = Tag.new({'name' => 'Shopping'})
tag6 = Tag.new({'name' => 'Food & Dining'})
tag7 = Tag.new({'name' => 'Investments'})
tag8 = Tag.new({'name' => 'Bills & Utilities'})
tag9 = Tag.new({'name' => 'Transport'})
tag10 = Tag.new({'name' => 'Travel'})
tag11 = Tag.new({'name' => 'Miscellaneous'})
t1 = tag1.save
t2 = tag2.save
t3 = tag3.save
t4 = tag4.save
t5 = tag5.save
t6 = tag6.save
t7 = tag7.save
t8 = tag8.save
t9 = tag9.save
t10 = tag10.save
t11 = tag11.save

transaction1 = Transaction.new({'merchant_id' => m1.id, 'tag_id' => t5.id, 'value' => 81.74, 'transaction_date' => '2016-04-30', 'description' => 'Weekly food shop from Tesco'})
tr1 = transaction1.save

transaction2 = Transaction.new({'merchant_id' => m2.id, 'tag_id' => t5.id, 'value' => 39.99, 'transaction_date' => '2016-05-15', 'description' => 'Bought a lamp'})
tr2 = transaction2.save

transaction3 = Transaction.new({'merchant_id' => m3.id, 'tag_id' => t5.id, 'value' => 54.99, 'transaction_date' => '2016-03-23', 'description' => 'Bought a cat palace for Alfred'})
tr3 = transaction3.save

transaction4 = Transaction.new({'merchant_id' => m4.id, 'tag_id' => t3.id, 'value' => 15.50, 'transaction_date' => '2016-04-01', 'description' => 'Went to cinema, got a small popcorn and a drink'})
tr4 = transaction4.save

transaction5 = Transaction.new({'merchant_id' => m5.id, 'tag_id' => t9.id, 'value' => 48.84, 'transaction_date' => '2016-05-12', 'description' => 'Half a tank of petrol'})
tr5 = transaction5.save

transaction6 = Transaction.new({'merchant_id' => m6.id, 'tag_id' => t1.id, 'value' => 22.95, 'transaction_date' => '2016-05-30', 'description' => 'Bought a vast quantity of Lynx Africa'})
tr6 = transaction6.save

transaction7 = Transaction.new({'merchant_id' => m7.id, 'tag_id' => t8.id, 'value' => 123.82, 'transaction_date' => '2016-04-27', 'description' => 'Monthly student loan bill'})
tr7 = transaction7.save

transaction8 = Transaction.new({'merchant_id' => m8.id, 'tag_id' => t8.id, 'value' => 58.35, 'transaction_date' => '2016-06-29', 'description' => 'Monthly electricity bill'})
tr8 = transaction8.save

transaction9 = Transaction.new({'merchant_id' => m9.id, 'tag_id' => t10.id, 'value' => 84.60, 'transaction_date' => '2016-07-02', 'description' => 'Cheap flight to Amsterdam'})
tr9 = transaction9.save

transaction10 = Transaction.new({'merchant_id' => m10.id, 'tag_id' => t5.id, 'value' => 56.43, 'transaction_date' => '2016-06-26', 'description' => 'Bought a lot of soup'})
tr10 = transaction10.save