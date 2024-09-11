# The Command pattern turns a request into a stand-alone object that contains all information about the request. 
# This transformation lets you parameterize methods with different requests, delay or queue a request's execution, 
# and support undoable operations.

class Command
  def execute
    raise NotImplementedError, "This method should be overridden"
  end
end

class Light
  def on
    puts "Light is on"
  end

  def off
    puts "Light is off"
  end
end

class LightOnCommand < Command
  def initialize(light)
    @light = light
  end

  def execute
    @light.on
  end
end

class LightOffCommand < Command
  def initialize(light)
    @light = light
  end

  def execute
    @light.off
  end
end

class RemoteControl
  def set_command(command)
    @command = command
  end

  def press_button
    @command.execute
  end
end

light = Light.new
light_on = LightOnCommand.new(light)
light_off = LightOffCommand.new(light)

remote = RemoteControl.new
remote.set_command(light_on)
remote.press_button  # Output: Light is on

remote.set_command(light_off)
remote.press_button  # Output: Light is off

# ruby design_patterns/command_dp.rb