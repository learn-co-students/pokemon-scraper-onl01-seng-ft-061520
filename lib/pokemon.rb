class Pokemon
    
    attr_accessor :id, :name, :type, :db
    
    def initialize (id:, name:, type:, db:)
        @id = id
        @name = name
        @type = type
        @db = db  
    end

    def self.save(name, type, db)
        db.execute("INSERT INTO pokemon(name, type) VALUES (?, ?);", name, type)
    end

      #find pokemon by id #return a new pokemon object
      def self.find(id, db)
        found_pokemon = db.execute("SELECT * FROM pokemon WHERE id = ?;", id).flatten
        #binding.pry
        #initialize the new Pokemon set attribute which have been defind as key word
        # and the value the data that return in search in the db
        Pokemon.new(id: found_pokemon[0], name: found_pokemon[1], type: found_pokemon[2], db: db)
      end
end
