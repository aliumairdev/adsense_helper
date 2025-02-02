$LOAD_PATH.push File.expand_path("../lib", __FILE__)
require "adsense_helper/version"

Gem::Specification.new do |s|
  s.name = "adsense_helper"
  s.version = AdsenseHelper::VERSION
  s.platform = Gem::Platform::RUBY
  s.author = ["Jianqiu Xiao"]
  s.email = ["swordray@gmail.com"]
  s.homepage = "https://bailushuyuan.org"
  s.summary = "Helper for Google Adsense Content"
  s.description = "An elegant way to write Google Adsense Code."
  s.license = "MIT"

  s.files = `git ls-files`.split("\n")
  s.executables = `git ls-files -- bin/*`.split("\n").map { |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.required_ruby_version = ">= 3.1"
end
