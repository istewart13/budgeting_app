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

  def tag()
    sql = "SELECT * FROM tags WHERE id = #{@tag_id}"
    return Tag.map_item(sql)
  end

  def merchant()
    sql = "SELECT * FROM merchants WHERE id = #{@merchant_id}"
    return Merchant.map_item(sql)
  end

  # def update(options)
  #   sql = "UPDATE transactions SET name = '#{name}' WHERE id = #{@id}"
  #   return Merchant.map_items(sql)
  # end

  def delete()
    Transaction.delete(@id)
  end

  def self.all()
    sql = "SELECT * FROM transactions"
    return Transaction.map_items(sql)
  end

  def self.find(id)
    sql = "SELECT * FROM transactions WHERE id = #{id}"
    return Transaction.map_item(sql)
  end

  def self.find_tag(tag_id)
    sql = "SELECT * FROM transactions WHERE tag_id = #{tag_id}"
    return Transaction.map_items(sql)
  end

  def self.update(options)
    sql = "UPDATE transactions 
    SET merchant_id = '#{options['merchant_id']}', tag_id = '#{options['tag_id']}', value = '#{options['value']}', transaction_date = '#{options['transaction_date']}', description = '#{options['description']}' 
    WHERE id = #{options['id']}"
    return Transaction.map_item(sql)
  end

  def self.delete(id)
    sql = "DELETE FROM transactions WHERE id = #{id}"
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