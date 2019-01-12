

Pod::Spec.new do |s|

  s.name         = "ShaHashesWrapper"
  s.version      = "1.0.0"
  s.summary      = "A simpler wrapper for SHA 256/512 to  create a Digital Digest which is considered a one-way encryption algorithm."
  s.homepage     = "https://github.com/dgariya/ShaHashesWrapper"
  s.license      = "MIT"
  s.author             = { "Dev" => "devgariya.gariya@gmail.com" }
  s.platform     = :ios, "11.0"
  s.source       = { :git => "https://github.com/dgariya/ShaHashesWrapper.git", :tag => "#{s.version}" }
  s.source_files  = "ShaHashesWrapper/"

end
