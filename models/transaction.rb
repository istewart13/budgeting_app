require_relative('../db/sql_runner')

class Transaction

  attr_reader :id, :merchant_id, :tag_id, :value, :transaction_date, :description

  def initialize( options )
    @id = options['id'].to_i
    @merchant_id = options['merchant_id'].to_i
    @tag_id = options['tag_id'].to_i
    @value = options['value'].to_f
    @transaction_date = options['transaction_date']
    @description = options['description']
  end

  def save()
    sql = "INSERT INTO transactions (merchant_id, tag_id, value, transaction_date, description) VALUES ('#{@merchant_id}', '#{@tag_id}', '#{@value}', '#{@transaction_date}', '#{@description}') RETURNING *"
    transaction = run(sql).first
    result = Transaction.new(transaction)
    return result
  end

  # def tag()
  #   sql = 
  # end

#   def members()
#     sql = "SELECT m.* FROM members m INNER JOIN rentals r ON r.member_id = members.id WHERE book_id = #{@id}"
#     return Member.map_items(sql)
#   end

  def self.all()
    sql = "SELECT * FROM transactions"
    return Transaction.map_items(sql)
  end

  def self.delete_all()
    sql = "DELETE FROM transactions"
    run(sql)
  end

  def self.map_items(sql)
    transaction = run(sql)
    result = transaction.map { |item| Transaction.new(item) }
    return result
  end

  def self.map_item(sql)
    result = Transaction.map_items(sql)
    return result.first
  end

end