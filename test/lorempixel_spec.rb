require "#{File.dirname(__FILE__)}/../lib/lorempixel"

describe Lorempixel do

  before(:all) do
    @lorempixel = Lorempixel.new
    @lorempixel.create_images
  end

  context "default variables" do
    Lorempixel.defaults.each do |k, v|
      it "should have default #{k}" do
        if k == :dir
          File.basename(@lorempixel.send(k)).should eq v
        else
          @lorempixel.send(k).should eq v
        end
      end
    end
  end

  context "can set custom variables on creation" do
    r = {
      :amount => 15,
      :prefix => "image_name_",
      :height => {
        :min => 300,
        :max => 700
      },
      :width => {
        :min => 400,
        :max => 900
      },
      :dir => "placeholders"
    }

    before(:all) do
      @custom_lorempixel = Lorempixel.new(r)
    end

    r.each do |k, v|
      it "should have custom #{k}" do
        if k == :dir
          File.basename(@custom_lorempixel.send(k)).should eq v
        else
          @custom_lorempixel.send(k).should eq v
        end
      end
    end
  end

  it "should create a directory" do
    File.directory?(@lorempixel.dir).should be true
  end

  it "should create the specified number of images with the correct prefix" do
    r = 0
    (1..@lorempixel.amount).each do |i|
      i_num = "%0#{@lorempixel.amount.to_s.length}d" % i
      r += 1 if File.exists?(File.join(@lorempixel.dir, "#{@lorempixel.prefix}#{i_num}.png"))
    end
    r.should eq @lorempixel.amount
  end
  
  after(:all) do
    FileUtils.rm_rf(@lorempixel.dir)
  end
end
