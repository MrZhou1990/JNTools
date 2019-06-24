Pod::Spec.new do |s|
  s.name         = "JNTools"
  s.version      = "0.0.1"
  s.summary      = "iOS开发的工具类及一些常用三方工具类的二次封装"
  s.homepage     = "https://github.com/MrZhou1990/JNTools"
  s.license      = "MIT"
  s.author       = { "Cloud" => "haohao10987@163.com" }
  s.platform     = :ios, "9.0"
  s.source       = { :git => "https://github.com/MrZhou1990/JNTools.git", :tag => "#{s.version}" }
  s.source_files  = "JNToolsDemo/JNToolsDemo/JNTools/**/*.{h,m}"
  s.dependency "SDWebImage", "5.0.6"
  s.dependency "MBProgressHUD", "1.1.0"
  s.dependency "AFNetworking", "3.2.1"
end
