# Ruby program to find the second largest element 
# from the array

arr = [12,45,23,39,38];
count = 0;

large1 = 0;
large2 = 0;

large1= arr[0];

while count < arr.size()
  if (large1 < arr[count]) 
    large2 = large1;
    large1 = arr[count];
  elsif( large2 < arr[count] )
    large2 =  arr[count];
  end
  count=count + 1;
end

print "Second largest element is: ",large2,"\n";
