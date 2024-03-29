require './http_hunt'

begin
  http_hunt = HttpHunt.new

  if ARGV.empty?
    puts 'Please enter stage you want to play!       Run command as:  ruby play.rb < stage1 || stage2 || stage3 || stage4 >'
    exit
  end

  case ARGV[0]
  when 'stage1'
    http_hunt.calculate_characters
  when 'stage2'
    http_hunt.calculate_words
  when 'stage3'
    http_hunt.calculate_sentences
  when 'stage4'
    http_hunt.calculate_vowels
  else
    puts 'Invalid stage!'
  end

  puts http_hunt.response
rescue StandardError => e
  puts e.message
end

