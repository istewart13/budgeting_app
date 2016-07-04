require('minitest/autorun')
require_relative('../models/tag')

class TestTag < MiniTest::Test

  def setup
    @tag = Tag.new('name' => 'Food')
  end

  def test_merchant_name()
    assert_equal('Food', @tag.name())
  end

end