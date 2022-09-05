# Ruby program to get the current weekday

Weekday = ["SUNDAY","MONDAY","TUESDAY","WEDNESDAY","THURSDAY","FRIDAY","SATURDAY"];

date_time = Time.new();

curretDateTime = date_time.inspect();

weeknum  = date_time.wday();

print "Weekday is: ",Weekday[weeknum];
