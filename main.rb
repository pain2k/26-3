if Gem.win_platform?
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__

  [STDIN, STDOUT].each do |io|
    io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end

require_relative "lib/clothes_reader"
require_relative "lib/result_printer"

VERSION = "Программа рекомендует одежду по погоду. Версия 1.0"

current_path = File.dirname(__FILE__)
clothes_path = current_path + '/data/*.txt'

puts "Сколько градусов за окном? (можно с минусом):"
print ">"
temperature = STDIN.gets.to_i

clothes = ClothesReader.new(clothes_path) #todo
result_printer = ResultPrinter.new(clothes, temperature)  #todo

