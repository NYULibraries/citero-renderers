$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "citero-renderers/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "citero-renderers"
  s.version     = CiteroRenderers::VERSION
  s.authors     = ["hab278"]
  s.email       = ["hab278@nyu.edu"]
  s.date        = "2016-08-15"
  s.summary     = "Rails renderers and mime types for acts_as_citable gem."
  s.homepage    = "https://github.com/NYULibraries/citero-renderers"

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]


  s.add_dependency "actionpack", "~> 4.2.7.1"
  s.add_development_dependency "rake"
end
