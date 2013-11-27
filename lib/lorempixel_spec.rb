require "#{File.dirname(__FILE__)}/lorempixel"

describe Lorempixel do

  before do
    @lorempixel = Lorempixel.new
  end

  context "default variables" do
    Lorempixel.defaults.each do |k, v|
      it "should have default #{k}" do
        if k == "dir"
          File.basename(@lorempixel.send(k)).should eq(v)
        else
          @lorempixel.send(k).should eq(v)
        end
      end
    end
  end

  context "can set custom variables on creation" do
    r = {
      "amount" => 15,
      "prefix" => "image_name_",
      "height" => {
        :min => 300,
        :max => 700
      },
      "width" => {
        :min => 400,
        :max => 900
      },
      "dir" => "placeholders"
    }

    before do
      @custom_lorempixel = Lorempixel.new(r)
    end

    r.each do |k, v|
      it "should have custom #{k}" do
        if k == "dir"
          File.basename(@custom_lorempixel.send(k)).should eq(v)
        else
          @custom_lorempixel.send(k).should eq(v)
        end
      end
    end
  end
  
end