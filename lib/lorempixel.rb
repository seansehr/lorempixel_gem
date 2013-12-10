require "#{File.dirname(__FILE__)}/image_saver"

class Lorempixel < Image_saver

  def get_provider
    height = rand(@height[:min]..@height[:max])
    width = rand(@width[:min]..@width[:max])
    "http://lorempixel.com/#{width}/#{height}/"
  end

end
