class Cloth
  attr_reader :name, :type
  def initialize(file)
    file = File.new(file, "r:UTF-8")
    results = file.readlines
    file.close
    @name = results[0].chomp
    @type = results[1].chomp
    range = results[2].delete('('')''\n').split(', ')
    @temp_from = range[0].to_i
    @temp_to = range[1].to_i
  end

  def temperature_between?(temperature)
    return if temperature.between?(@temp_from..@temp_to)
  end
end