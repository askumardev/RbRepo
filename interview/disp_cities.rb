# ruby interview/disp_cities.rb

city_names = {
  'delhi' => '011',
  'hyderabad' => '040',
  'bangalore' => '080',
  'chennai' => '020',
  'kochi' => '999'
}

def show_cities(city_names)
  city_names.each { |k, _v| puts k.capitalize }
end

def find_code(city_names, city)
  city = city.downcase
  if city_names.key?(city)
    puts "The code for #{city.capitalize} is #{city_names[city]}"
  else
    puts 'City not present'
  end
end

loop do
  puts 'Do you want to continue? (Y/N)'
  ans = gets.chomp.upcase
  break if ans != 'Y'

  puts 'Please choose a city'
  show_cities(city_names)
  city = gets.chomp

  find_code(city_names, city)
end