# Template Method:
# Defines the steps of an algorithm in a base class and lets subclasses override steps.

class DataReport
  def generate
    header
    body
    footer
  end

  def header
    raise NotImplementedError
  end

  def body
    raise NotImplementedError
  end

  def footer
    puts "End of report"
  end
end

class TextReport < DataReport
  def header
    puts "TEXT REPORT"
  end

  def body
    puts "Ruby pattern examples"
  end
end

class CsvReport < DataReport
  def header
    puts "pattern,description"
  end

  def body
    puts "singleton,one instance"
  end
end

TextReport.new.generate
puts "---"
CsvReport.new.generate
