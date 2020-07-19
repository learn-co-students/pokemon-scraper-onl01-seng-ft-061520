class Pokemon
  attr_accessor :name, :type, :id, :db
  def initialize(name:, type:, db:, id: nil)
    @name = name
    @type = type
    @db = db
    @id = id
  end

  def self.save(name, type, db)
    sql = <<-SQL
      INSERT INTO pokemon (name, type) 
      VALUES (?, ?) 
    SQL

    db.execute(sql, name, type)
  end

  def self.find(id, db)
    sql = <<-SQL
      SELECT * FROM pokemon
      WHERE id = ?
    SQL

    pokemon_found = db.execute(sql, id)[0]
    Pokemon.new(id: pokemon_found[0], name: pokemon_found[1], type: pokemon_found[2], db: db)
  end
end
