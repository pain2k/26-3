class ClothesReader
  attr_reader :things
  def initialize(clothes_path)
    @things = []
    for item in clothes_path do
      file = Cloth.new(item)
      @things << file
    end
  end
end