# Ruby program to get the GCD and LCM using 
# the gcdlcm() library function

# ruby basics/gcd_lcm_fun.rb

print "Enter number1: ";
num1 = gets.chomp.to_i;  

print "Enter number2: ";
num2 = gets.chomp.to_i;  

gcd,lcm = num1.gcdlcm(num2);

print "Greatest Common Divisor: ",gcd,"\n";
print "Lowest Common Multiple:  ",lcm,"\n";