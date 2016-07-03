require_relative('../db/sql_runner')

class Merchant

  attr_reader :id, :name

  def initialize( options )
    @id = options['id'].to_i
    @name = options['name']
  end

  def save()
    sql = "INSERT INTO merchants (name) VALUES ('#{@name}') RETURNING *"
    merchant = run(sql).first
    result = Merchant.new(merchant)
    return result
  end

  def tags()
    sql = "SELECT tags.* FROM tags INNER JOIN transactions ON transactions.tag_id = tags.id WHERE merchant_id = #{@id};"
    return Tag.map_items(sql)
  end

  def update(name)
    sql = "UPDATE merchants SET name = '#{name}' WHERE id = #{@id}"
    return Merchant.map_items(sql)
  end

  def delete()
    Merchant.delete(@id)
  end

  def self.all()
    sql = "SELECT * FROM merchants"
    return Merchant.map_items(sql)
  end

  def self.find(id)
    sql = "SELECT * FROM merchants WHERE id = #{id}"
    return Merchant.map_items(sql)
  end

  def self.delete(id)
    sql = "DELETE FROM merchants WHERE id = #{id}"
    return Merchant.map_items(sql)
  end

  def self.delete_all()
    sql = "DELETE FROM merchants"
    run(sql)
  end

  def self.map_items(sql)
    merchant = run(sql)
    result = merchant.map { |name| Merchant.new(name) }
    return result
  end

  def self.map_item(sql)
    result = Merchant.map_items(sql)
    return result.first
  end

end