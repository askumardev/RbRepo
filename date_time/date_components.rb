# Ruby program to get the individual components 
# of current date time

date_time = Time.new();

curretDateTime = date_time.inspect();

year  = date_time.year();
month = date_time.month();
day   = date_time.day();

hour   = date_time.hour();
minute = date_time.min();
second = date_time.sec();

printf "DateTime: %02d/%02d/%04d %02d:%02d:%02d ",day, month,year,hour,minute,second;
