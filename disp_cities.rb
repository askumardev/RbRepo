city_names = {
	"delhi" =>"011",
	"hyderabad" => "040",
	"banglore" => "080",
	"chennai" => "020",
	"kochi" => "999"
}
def show_cities(city_names)
	city_names.each { |k,v | puts k.capitalize }	
end

def find_code(city_names,city_code)
	if city_names.key?(city_code)
		puts "the code for city is #{city_names[city_code]}"
	else
		puts "list not present"
	end
end

loop do 
	puts "do u want to continue?(Y/N)"
	ans = gets.chomp
	if ans != "Y"
		break
	else
		puts "please choose city"
		show_cities(city_names)
		city_code = gets.chomp

		find_code(city_names,city_code)
	end	
end