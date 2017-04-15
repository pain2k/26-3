class ClothesReader
  attr_reader :things
  def initialize(current_path)
    clothes_path = Dir.glob(current_path + "/data/*.txt")

    @things = []
    for item in clothes_path do
      file = Cloth.new(item)
      @things << file
    end
  end
end