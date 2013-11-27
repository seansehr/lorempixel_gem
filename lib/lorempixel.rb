require "httpclient"

class Lorempixel
  attr_writer :args
  attr_reader :amount, :a_length, :dir, :prefix, :size

  def initialize args = {}
    @args = args
    @amount = args[:amount] || 10
    @a_length = @amount.to_s.length
    @prefix = args[:name]  || 'image_'
    @host = 'http://lorempixel.com/'

    @size = Hash.new
    @size[:height] = self.set(:height)
    @size[:width] = self.set(:width)

    dir = args[:dir] || 'images'
    unless File.directory?(dir)
      Dir.mkdir(dir)
    end
    @dir = Dir.new(dir)
    Dir.chdir(dir)
  end

  def create_images
    (1..@amount).each do |i|
      height = rand(@size[:height][:min]..@size[:height][:max])
      width = rand(@size[:width][:min]..@size[:width][:max])
      i_num = "%0#{@a_length}d" % i
      url = "#{@host}#{width}/#{height}/"
      HTTPClient.new
      result = HTTPClient.get url
      File.open("#{@prefix}#{i_num}.png", "w") do |f|
        f.write(result.body)
      end
    end
  end

  def set prop
    r = {:min => 100, :max => 500}
    if @args[prop]
      split = @args[prop].split("-")
      r[:min] = split.first.to_i
      r[:max] = split.last.to_i
    end
    r
  end
end
