class ClothesReader
  attr_reader :collection
  def initialize(current_path)
    clothes_path = Dir.glob(current_path + "/data/*.txt")

    @collection = []
    for item in clothes_path do
      file = Cloth.new(item)
      @collection << file
    end
  end
end