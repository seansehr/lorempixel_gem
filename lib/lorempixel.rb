require "httpclient"

class Lorempixel
  attr_writer :args
  attr_reader :amount, :a_length, :dir, :prefix

  def initialize (args = {})
    @amount = args[:amount] || 10
    @a_length = @amount.to_s.length
    @prefix = args[:name]  || 'image_'
    @host = 'http://lorempixel.com/'

    @size = {
      :height => {
        :min => 100,
        :max => 1000
      },
      :width => {
        :min => 100,
        :max => 1000
      }
    }

    dir = args[:dir] || 'images'
    unless File.directory?(dir)
      Dir.mkdir(dir)
    end
    @dir = Dir.new(dir)
    Dir.chdir(dir)
  end

  def create_images
    (1..@amount).each do |i|
      i_num = "%0#{@a_length}d" % i
      url = "#{@host}#{self.get_width}/#{self.get_height}/"
      puts url
      HTTPClient.new
      result = HTTPClient.get url
      File.open("#{@prefix}#{i_num}.png", "w") do |f|
        f.write(result.body)
      end
    end
  end

  def get_height
    rand(@size[:height][:min]..@size[:height][:max])
  end

  def get_width
    rand(@size[:width][:min]..@size[:width][:max])
  end
end