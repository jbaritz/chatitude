require 'pg'

module Chat
  class DB
    def self.create_tables
      db.exec <<-SQL
        CREATE TABLE IF NOT EXISTS users(
          id SERIAL PRIMARY KEY,
          username VARCHAR,
          password VARCHAR
          );  
      SQL
    end

    def self.connect_db
      PG.connect(host: 'localhost', dbname: 'chatitude')
    end

    def self.new_user(name, pword, db)
      sql = <<-SQL
        INSERT INTO users (username, password)
        values ($1, $2) returning *
        SQL
      db.exec(sql, [name, pword]).to_a.first      
    end

    def self.find_user_byname(username, db)
      db.exec("SELECT * FROM users where username = $1", [username]).to_a.first
    end

  end
end