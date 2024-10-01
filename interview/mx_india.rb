# ruby interview/mx_india.rb

talks = [
   {"title" => "Opening Keynote", "start_time" => "9:00", "end_time" => "10:00"},
   {"title" => "Machine Learning Trends", "start_time" => "10:15", "end_time" => "11:15"},
   {"title" => "Lunch Break", "start_time" => "12:00", "end_time" => "13:00"},
   {"title" => "Web Development Best Practices", "start_time" => "13:30", "end_time" => "14:30"},
   {"title" => "Data Privacy in the Digital Age", "start_time" => "15:00", "end_time" => "16:00"},
   {"title" => "Networking Session", "start_time" => "16:30", "end_time" => "17:30"},
   {"title" => "AI Ethics Panel", "start_time" => "11:30", "end_time" => "12:30"},
   {"title" => "Cybersecurity Workshop", "start_time" => "14:45", "end_time" => "15:45"},
]


def time_to_int(time_str)
  time_str.gsub(":", "").to_i
end

overlaps = []

talks.each_with_index do |talk1, i|
  start_time1 = time_to_int(talk1["start_time"])
  end_time1 = time_to_int(talk1["end_time"])

  talks.each_with_index do |talk2, j|
    next if i == j # Skip comparing the same talk

    start_time2 = time_to_int(talk2["start_time"])
    end_time2 = time_to_int(talk2["end_time"])

    # Use `between?` to check overlap
    if start_time1.between?(start_time2, end_time2) || end_time1.between?(start_time2, end_time2) ||
       start_time2.between?(start_time1, end_time1) || end_time2.between?(start_time1, end_time1)
      overlaps << {talk1: talk1["title"], talk2: talk2["title"]}
    end
  end
end
p overlaps

# Display the overlapping talks
overlaps.uniq! # Remove duplicate pairs
if overlaps.empty?
  puts "No overlapping talks."
else
  puts "Overlapping talks:"
  overlaps.each { |pair| puts "#{pair[:talk1]} overlaps with #{pair[:talk2]}" }
end
