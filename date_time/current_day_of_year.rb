# Ruby program to get the current day 
# of year out of 365

date_time = Time.new();
curretDateTime = date_time.inspect();

dayOfYear  = date_time.yday();

print "Current day of year(Out of 365) is: ",dayOfYear;
