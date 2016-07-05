require_relative('transaction')
require('pry-byebug')

class Analysis

  def initialize(transactions)
    @transactions = transactions
  end

  def total_expenditure()
    total = 0
    @transactions.each { |transaction| total += transaction.value } 
    return total
  end

end