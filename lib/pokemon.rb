class Pokemon
    attr_accessor :id, :name, :type, :db

    def initialize(id:, name:, type:, db:)
        @id = id
        @name =  name
        @type = type
        @db = db

    end

    def self.save(name, type, db)
        db.execute("INSERT INTO pokemon (name, type) VALUES(?, ?);", name, type)
    end

    def self.find(id, db)
        pokemon_parts = db.execute("SELECT * FROM pokemon WHERE id = ?;", id).flatten

        new_pokemon = Pokemon.new(id: pokemon_parts[0], name: pokemon_parts[1], type: pokemon_parts[2], db: db)
        new_pokemon
    end

end
