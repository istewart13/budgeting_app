require('minitest/autorun')
require_relative('../models/transaction')
require_relative('../models/merchant')
require_relative('../models/tag')

class TestTransaction < MiniTest::Test

  def setup
    merchant1 = Merchant.new('name' => 'Tesco')
    m1 = merchant1.save

    tag1 = Tag.new({'name' => 'Food'})
    t1 = tag1.save

    @transaction1 = Transaction.new({'merchant_id' => m1.id, 'tag_id' => t1.id, 'value' => 80, 'transaction_date' => '2016-04-30', 'description' => 'Weekly food shop from Tesco'})
  end

  def test_value
    assert_equal(80, @transaction1.value())
  end

  def test_transaction_date
    assert_equal('2016-04-30', @transaction1.transaction_date())
  end

  def test_description
    assert_equal('Weekly food shop from Tesco', @transaction1.description())
  end

end