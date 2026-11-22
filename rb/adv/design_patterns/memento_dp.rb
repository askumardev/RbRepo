# Memento:
# Saves and restores an object's internal state without exposing implementation details.

class Editor
  attr_accessor :text

  def initialize(text)
    @text = text
  end

  def save
    @text.dup
  end

  def restore(snapshot)
    @text = snapshot.dup
  end
end

editor = Editor.new("Draft")
snapshot = editor.save
editor.text = "Published"
puts "Before restore: #{editor.text}"
editor.restore(snapshot)
puts "After restore: #{editor.text}"
