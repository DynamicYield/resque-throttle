Gem::Specification.new do |s|
  s.name        = 'resque-throttle'
  s.version     = '0.0.2'
  s.date        = '2016-01-11'
  s.summary     = 'Throttled unique Resque jobs'
  s.description = 'Throttled unique Resque jobs'
  s.authors     = ['Dynamic Yield']
  s.email       = 'support@dynamicyield.com'
  s.files       = ['LICENSE', 'Gemfile', "#{s.name}.gemspec"] + Dir['lib/*.rb'] + Dir['lib/**/*.rb']
  s.homepage    = ''
  s.license     = 'Proprietary (license required)'

  s.add_dependency 'resque', '~> 1.20'
  s.add_dependency 'resque-loner', '1.3.0'
end
