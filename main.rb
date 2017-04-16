if Gem.win_platform?
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__

  [STDIN, STDOUT].each do |io|
    io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end

require_relative "lib/clothes_reader"
require_relative "lib/cloth"

VERSION = "Программа рекомендует одежду по погоду. Версия 1.0"

current_path = File.dirname(__FILE__)
clothes = ClothesReader.new(current_path)

puts "Сколько градусов за окном? (можно с минусом):"
print ">"
temperature = STDIN.gets.to_i

cloth_types_uniq = clothes.collection.map { |cloth| cloth.type } .uniq!

puts "Рекомендуем следующую одежду:"
for item in cloth_types_uniq
  cloth_by_temp = clothes.collection.find_all { |cloth| (cloth.type == item && cloth.temperature_between?(temperature)) }
  if cloth_by_temp.size == 0
    puts "#{item}: нет подходящих предметов"
  else
    puts "#{item}: #{cloth_by_temp.sample.cloth_name}"
  end
end
