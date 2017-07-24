Gem::Specification.new do |s|
  s.name        = 'sshkit_addon'
  s.version     = '1.0.0'
  s.date        = '2010-04-28'
  s.summary     = "sshkit addon"
  s.description = "Addon of the sshkit"
  s.authors     = ["Zhimin Wen"]
  s.email       = 'zhimin.wen@gmail.com'
  s.files       = Dir["lib/**/*.rb"]

  s.homepage    = 'http://github.com/zhiminwen/sshkit_addon'
  s.license     = 'MIT'

  s.add_dependency 'sshkit', '~> 1.12'
end