# ruby solid/dependency_inversion_principle.rb

class UserService
  def initialize(db)
    @db = db
  end

  def save_user
    @db.save
  end
end

class MySQLDB
  def save
    puts "Saving to MySQL"
  end
end

class MongoDB
  def save
    puts "Saving to MongoDB"
  end
end


service = UserService.new(MySQLDB.new)
service.save_user
