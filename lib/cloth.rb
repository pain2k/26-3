class Cloth
  attr_reader :cloth_name, :type
  def initialize(file_path)
    results = File.readlines(file_path, :encoding => "UTF-8")

    @cloth_name = results[0].chomp
    @type = results[1].chomp
    range = results[2].delete('('')').split(', ')
    @temp_from = range[0].to_i
    @temp_to = range[1].to_i
  end

  def temperature_between?(temperature)
    return (@temp_from..@temp_to).include?(temperature)
  end

end