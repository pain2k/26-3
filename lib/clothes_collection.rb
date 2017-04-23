class ClothesCollection
  def initialize(current_path)
    @collection = []
    @current_path = current_path
    read_from_files
    @types_uniq = []
    types_uniq
  end

  def read_from_files
    clothes_path = Dir.glob(@current_path + "/data/*.txt")
    for item in clothes_path do
      cloth = Cloth.new(item)
      @collection << cloth
    end
  end

  def types_uniq
    @collection.each do |cloth|
      @types_uniq << cloth.type unless @types_uniq.include?(cloth.type)
    end
  end

  def recommend_by_temp(temperature)
    for item in @types_uniq
      cloth_by_temp = @collection.find_all { |cloth| cloth.type == item && cloth.temperature_between?(temperature) }
      if cloth_by_temp.size == 0
        puts "#{item}: нет подходящих предметов"
      else
        puts "#{item}: #{cloth_by_temp.sample.cloth_name}"
      end
    end

  end
end
