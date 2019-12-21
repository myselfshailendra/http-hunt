require './http_hunt'

begin
  http_hunt = HttpHunt.new
  http_hunt.calculate_size
  puts http_hunt.response
rescue StandardError => e
  puts e.message
end

