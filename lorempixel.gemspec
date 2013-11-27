Gem::Specification.new do |s|
  s.name        = 'lorempixel'
  s.version     = '0.0.0'
  s.date        = '2013-11-19'
  s.summary     = "Dummy Image Generator"
  s.description = "A Ruby gem for making dummy images from www.lorempixel.com"
  s.authors     = ["Sean Sehr"]
  s.email       = 'sean@seansehr.com'
  s.files       = ["lib/lorempixel.rb"]
  s.homepage    =
    'https://github.com/xeraseth/lorempixel_gem'
  s.license     = 'MIT'
  s.executables << 'lorempixel'

  s.add_runtime_dependency "trollop"
  s.add_runtime_dependency "httpclient"
end
