class ClothesReader
  def initialize(path)
    unless File.exist?(path)
      abort "Файл с результатами #{path} не найден."
    end

    file = File.new(results_path, "r:UTF-8")
    @results = file.readlines
    file.close
  end
end