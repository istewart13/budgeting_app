require_relative('../db/sql_runner')

class Tag

  attr_reader :id, :name

  def initialize( options )
    @id = options['id'].to_i
    @name = options['name']
  end

  def save()
    sql = "INSERT INTO tags (name) VALUES ('#{@name}') RETURNING *"
    tag = run(sql).first
    result = Tag.new(tag)
    return result
  end

  def save_check()
    sql = "INSERT INTO tags (name) SELECT DISTINCT '#{@name}'
    FROM tags
    WHERE NOT EXISTS (SELECT name FROM tags WHERE LOWER(name) = LOWER('#{@name}')) RETURNING *;"
    tag = run(sql).first
    if tag != nil
      result = Tag.new(tag)
      return result
    else
      return false
    end
  end

  def merchants()
    sql = "SELECT merchants.* FROM merchants INNER JOIN transactions ON transactions.merchant_id = merchants.id WHERE tag_id = #{@id};"
    return Merchant.map_items(sql)
  end

  def update(name)
    sql = "UPDATE tags SET name = '#{name}' WHERE id = #{@id}"
    return Tag.map_items(sql)
  end

  def delete()
    Tag.delete(@id)
  end

  def self.all()
    sql = "SELECT * FROM tags"
    return Tag.map_items(sql)
  end
  
  def self.find(id)
    sql = "SELECT * FROM tags WHERE id = #{id}"
    return Tag.map_item(sql)
  end

  def self.update(options)
    sql = "UPDATE tags SET name = '#{options['name']}' WHERE id = #{options['id']}"
    return Tag.map_item(sql)
  end

  def self.delete(id)
    sql = "DELETE FROM tags WHERE id = #{id}"
    return Tag.map_items(sql)
  end

  def self.delete_all()
    sql = "DELETE FROM tags"
    run(sql)
  end

  def self.map_items(sql)
    tag = run(sql)
    result = tag.map { |category| Tag.new(category) }
    return result
  end

  def self.map_item(sql)
    result = Tag.map_items(sql)
    return result.first
  end

end