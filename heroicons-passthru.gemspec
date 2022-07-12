$LOAD_PATH.push File.expand_path("lib", __dir__)
require "heroicons-passthru/version"
Gem::Specification.new do |s|
  s.name        = 'heroicons-passthru'
  s.version     = HeroiconsPassthru::VERSION
  s.summary     = "Render Heroicons from your local dir"
  s.description = "Helper to render heroicons HTML using a specified directory of Heroicons"
  s.authors     = ["Kester Dobson"]
  s.email       = 'post@kdobson.net'
  s.files       = ["lib/heroicons-passthru.rb"]
  s.homepage    =
    'https://rubygems.org/gems/heroicons-passthru'
  s.license       = 'MIT'

    s.add_dependency "nokogiri"
end
