lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)

Gem::Specification.new do |s|
  s.name        = 'refined'
  s.version     = '0.0.0'
  s.summary     = "Scopeless!"
  s.description = "Refine scopes!"
  s.authors     = ["Dave Ott"]
  s.email       = 'daveott@daveott.net'
  s.files       = ["lib/refined.rb"]
  s.homepage    = 'http://rubygems.org/gems/refined'

  s.add_development_dependency 'activerecord'
  s.add_development_dependency 'activesupport'
  s.add_development_dependency 'rspec'
  s.add_development_dependency 'ruby-debug19'
  s.add_development_dependency 'sqlite3-ruby'
end
