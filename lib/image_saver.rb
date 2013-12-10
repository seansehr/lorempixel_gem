require "httpclient"

class Image_saver
  attr_reader :amount, :dir, :prefix, :height, :width

  def initialize args = {}
    self.format_dimensions args
    self.set_props args

    unless File.directory?(@dir)
      Dir.mkdir(@dir)
    end
    @dir = Dir.new(dir)
  end

  def format_dimensions args
    [:height, :width].each do |v|
      if args[v]
        if args[v].respond_to?("split")
          r = args[v].split("-")
          args[v] = {
            :min => r.first.chomp.to_i,
            :max => r.last.chomp.to_i,
          }
        else
          d = self.class.defaults
          args[v][:min] = args[v][:min] || d[v][:min]
          args[v][:max] = args[v][:max] || d[v][:max]
        end
      end
    end
  end

  def set_props args
    self.class.defaults.each do |k, v|
      v = args[k] || v
      self.instance_variable_set("@#{k}", v)
    end
  end

  def self.defaults
    r = {
      :amount => 10,
      :prefix => "image_",
      :height => {
        :min => 100,
        :max => 500
      },
      :width => {
        :min => 100,
        :max => 500
      },
      :dir => "images"
    }
    r
  end

  def create_images
    (1..@amount).each do |i|
      url = self.get_provider

      i_num = "%0#{@amount.to_s.length}d" % i

      HTTPClient.new
      result = HTTPClient.get url
      File.open(File.join(@dir, "#{@prefix}#{i_num}.png"), "w") do |f|
        f.write(result.body)
      end
    end
  end

  def get_provider
    abort "No image provider specified"
  end

end
