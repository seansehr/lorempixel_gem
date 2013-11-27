require "httpclient"

class Lorempixel
  attr_reader :amount, :dir, :prefix, :height, :width

  def initialize args = {}
    self.format_dimensions args
    self.set_props args

    unless File.directory?(@dir)
      Dir.mkdir(@dir)
    end
    @dir = Dir.new(dir)
    Dir.chdir(@dir)
  end

  def format_dimensions args
    [:height, :width].each do |v|
      if args[v]
        r = args[v].split("-")
        args[v] = {
          :min => r.first.chomp.to_i,
          :max => r.last.chomp.to_i,
        }
      end
    end
  end

  def set_props args
    self.class.defaults.each do |k, v|
      v = args[k.to_sym] || v
      self.instance_variable_set("@#{k}", v)
    end
  end

  def self.defaults
    r = {
      "amount" => 10,
      "prefix" => "image_",
      "height" => {
        :min => 100,
        :max => 500
      },
      "width" => {
        :min => 100,
        :max => 500
      },
      "dir" => "images"
    }
    r
  end

  def create_images
    (1..@amount).each do |i|
      url = self.get_provider

      i_num = "%0#{@amount.to_s.length}d" % i

      HTTPClient.new
      result = HTTPClient.get url
      File.open("#{@prefix}#{i_num}.png", "w") do |f|
        f.write(result.body)
      end
    end
  end

  def get_provider
    height = rand(@height[:min]..@height[:max])
    width = rand(@width[:min]..@width[:max])
    "http://lorempixel.com/#{width}/#{height}/"
  end

end
