if Gem.win_platform?
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__

  [STDIN, STDOUT].each do |io|
    io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end

require_relative "lib/clothes_reader"
require_relative "lib/cloth"
#require_relative "lib/result_printer"

VERSION = "Программа рекомендует одежду по погоду. Версия 1.0"

current_path = File.dirname(__FILE__)
clothes_path = Dir.glob(current_path + "/data/*.txt")

clothes_input = ClothesReader.new(clothes_path)
clothes_collection = clothes_input.things




#cloth_temp_range = clothes.map { |cloth| cloth.temp_from }
#puts cloth_temp_range


puts "Сколько градусов за окном? (можно с минусом):"
print ">"
temperature = STDIN.gets.to_i



#result_printer = ResultPrinter.new(clothes, temperature)  #todo

