Pod::Spec.new do |s|
  s.name         = "JNTools"
  s.version      = "0.0.2"
  s.summary      = "iOS开发的工具类、分类及一些常用三方工具类的二次封装"
  s.homepage     = "https://github.com/MrZhou1990/JNTools"
  s.license      = "MIT"
  s.author       = { "Cloud" => "haohao10987@163.com" }
  s.platform     = :ios, "9.0"
  s.source       = { :git => "https://github.com/MrZhou1990/JNTools.git", :tag => "#{s.version}" }
  s.source_files  = "JNTools/JNCommon.h"
  s.subspec 'Category' do |subCategory|
    subCategory.source_files = "JNTools/Category/*.{h,m}"
    subCategory.dependency "SDWebImage", "5.0.6"
    subCategory.dependency "MBProgressHUD", "1.1.0"
  end
  s.subspec 'Define' do |subDefine|
    subDefine.source_files = "JNTools/Define/*.h"
  end
  s.subspec 'JNTool' do |subJNTool|
    subJNTool.source_files = "JNTools/JNTool/*.{h,m}"
    subJNTool.dependency "AFNetworking", "3.2.1"
  end  
end
