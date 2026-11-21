# ruby leetcode/medium/539-minimum-time-difference.rb

# Given a list of 24-hour clock time points in "Hour:Minutes" format, find the minimum minutes difference
# between any two time points in the list.
# Example 1:
# Input: ["23:59","00:00"]
# Output: 1
# Note:
# The number of time points in the given list is at least 2 and won't exceed 20000.
# The input time is legal and ranges from 00:00 to 23:59.

def find_min_difference(time_points)
  time_points = set_time_points_to_numbers(time_points)
  iterate_and_find_min(time_points)
end

def iterate_and_find_min(time_points)
  min = 1440
  
  time_points.each_with_index do |time, index|        
    prev_time = time_points[index - 1]
    
    min = [
      min,
      (time - prev_time).abs,
      1440 - prev_time + time
    ].min
  end
  
  min
end

def set_time_points_to_numbers(time_points)
  time_points.each_with_index do |time, index|
    time_points[index] = minutes(time)
  end
  
  time_points.sort
end

def minutes(time)
  time_in_hours_and_minutes = time.split(':')
  
  hours = time_in_hours_and_minutes[0].to_i
  minutes = time_in_hours_and_minutes[1].to_i
  
  hours * 60 + minutes
end