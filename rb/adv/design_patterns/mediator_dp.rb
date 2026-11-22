# Mediator:
# Centralizes communication between objects so they do not reference each other directly.

class ChatRoom
  def initialize
    @users = []
  end

  def register(user)
    @users << user
  end

  def broadcast(sender, message)
    @users.reject { |user| user.equal?(sender) }.each do |user|
      user.receive(sender.name, message)
    end
  end
end

class ChatUser
  attr_reader :name

  def initialize(name, room)
    @name = name
    @room = room
  end

  def send(message)
    @room.broadcast(self, message)
  end

  def receive(sender_name, message)
    puts "#{name} received from #{sender_name}: #{message}"
  end
end

room = ChatRoom.new
alice = ChatUser.new("Alice", room)
bob = ChatUser.new("Bob", room)
room.register(alice)
room.register(bob)
alice.send("Hello!")
