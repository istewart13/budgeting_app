require('minitest/autorun')
require_relative('../models/analysis')

class TestAnalysis < Minitest::Test

  def setup
    transaction1 = Transaction.new(...)
    transaction2 = Transaction.new(...)
    @analysis = Analysis.new([transaction1, transaction2])
  end

  # def test_total_transaction_value
  #   result = @analysis.total_revenue
  #   assert_equal(160, result)
  # end

end