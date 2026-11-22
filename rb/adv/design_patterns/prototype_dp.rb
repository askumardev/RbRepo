# Prototype:
# Creates new objects by copying an existing prototype.
# Ruby's dup and clone are useful here; clone also copies the singleton state.

class Document
  attr_accessor :title, :body

  def initialize(title, body)
    @title = title
    @body = body
  end

  def summary
    "#{title}: #{body}"
  end
end

template = Document.new("Status Report", "Work in progress")
march_report = template.dup
march_report.title = "March Status Report"

puts template.summary
puts march_report.summary
puts "Separate objects: #{template.object_id != march_report.object_id}"
