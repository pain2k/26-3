if Gem.win_platform?
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__

  [STDIN, STDOUT].each do |io|
    io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end

require_relative "lib/cloth"
require_relative "lib/clothes_collection"

VERSION = "Программа рекомендует одежду по погоду. Версия 1.0"

current_path = File.dirname(__FILE__)
clothes_collection = ClothesCollection.new(current_path)
clothes_uniq = clothes_collection.types_uniq

puts "Сколько градусов за окном? (можно с минусом):"
print ">"
temperature = STDIN.gets.to_i

clothes_uniq.each do |cloth_type|
  if clothes_collection.recommend_by_temp(temperature,cloth_type).empty?
    puts "#{cloth_type}: Нет подходящих предметов"
  else
    puts "#{cloth_type}: #{clothes_collection.recommend_by_temp(temperature,cloth_type).sample.name}"
  end
end
