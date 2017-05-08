class ClothesCollection
  attr_reader :types_uniq
  def initialize(current_path)
    @collection = []
    @current_path = current_path
    read_from_files
    @types_uniq = []
    types_uniq_calc
  end

  def read_from_files
    clothes_path = Dir.glob(@current_path + "/data/*.txt")
    clothes_path.each { |dir| @collection << Cloth.new(dir) }
  end

  def types_uniq_calc
    @collection.each do |cloth|
      @types_uniq << cloth.type unless @types_uniq.include?(cloth.type)
    end
  end

  def recommend_by_temp(temperature,thing)
    return @collection.select { |cloth| cloth.type == thing && cloth.temperature_between?(temperature) }
  end
end
