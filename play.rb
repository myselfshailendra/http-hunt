require './http_hunt'

begin
  http_hunt = HttpHunt.new
  http_hunt.calculate_size
rescue StandardError => e
  puts e.message
end

puts http_hunt.output
