lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)

Gem::Specification.new do |s|
  s.name        = 'refined'
  s.version     = '0.0.2'
  s.summary     = "Refined!"
  s.description = "Refined scopes ActiveRecord collections automagicaly."
  s.authors     = ["Dave Ott"]
  s.email       = 'daveott@daveott.net'
  s.files       = ["lib/refined.rb"]
  s.homepage    = 'http://rubygems.org/gems/refined'

  s.files = Dir.glob("lib/**/*.rb") + %w(README.md)
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  
  s.add_development_dependency 'activerecord'
  s.add_development_dependency 'activesupport'
  s.add_development_dependency 'rspec'
  s.add_development_dependency 'ruby-debug19'
  s.add_development_dependency 'sqlite3-ruby'
end
