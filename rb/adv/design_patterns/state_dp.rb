# State:
# Allows an object to change behavior when its internal state changes.

class MusicPlayer
  def initialize
    @state = StoppedState.new
  end

  def state=(state)
    @state = state
  end

  def play
    @state.play(self)
  end

  def pause
    @state.pause(self)
  end
end

class StoppedState
  def play(player)
    puts "Starting playback"
    player.state = PlayingState.new
  end

  def pause(_player)
    puts "Already stopped"
  end
end

class PlayingState
  def play(_player)
    puts "Already playing"
  end

  def pause(player)
    puts "Pausing playback"
    player.state = StoppedState.new
  end
end

player = MusicPlayer.new
player.play
player.play
player.pause
