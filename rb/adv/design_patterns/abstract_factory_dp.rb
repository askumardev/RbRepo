# Abstract Factory:
# Creates families of related objects without exposing their concrete classes.
# Use when products must be consistent as a group (for example, one UI theme).

class Button
  def render
    raise NotImplementedError
  end
end

class LightButton < Button
  def render
    "Light button"
  end
end

class DarkButton < Button
  def render
    "Dark button"
  end
end

class Checkbox
  def render
    raise NotImplementedError
  end
end

class LightCheckbox < Checkbox
  def render
    "Light checkbox"
  end
end

class DarkCheckbox < Checkbox
  def render
    "Dark checkbox"
  end
end

class ThemeFactory
  def button
    raise NotImplementedError
  end

  def checkbox
    raise NotImplementedError
  end
end

class LightThemeFactory < ThemeFactory
  def button
    LightButton.new
  end

  def checkbox
    LightCheckbox.new
  end
end

class DarkThemeFactory < ThemeFactory
  def button
    DarkButton.new
  end

  def checkbox
    DarkCheckbox.new
  end
end

def build_theme(factory)
  [factory.button.render, factory.checkbox.render]
end

puts build_theme(LightThemeFactory.new)
puts build_theme(DarkThemeFactory.new)
