Pod::Spec.new do |s|
  s.name         = "JNTools"
  s.version      = "1.0.1"
  s.summary      = "iOS开发的工具类、分类"
  s.homepage     = "https://github.com/MrZhou1990/JNTools"
  s.license      = "MIT"
  s.author       = { "Cloud" => "haohao10987@163.com" }
  s.platform     = :ios, "9.0"
  s.source       = { :git => "https://github.com/MrZhou1990/JNTools.git", :tag => "#{s.version}" }
  s.source_files  = "JNTools/JNCommon.h"
  s.public_header_files = "JNTools/JNCommon.h"
  s.subspec 'Category' do |subCategory|
    subCategory.source_files = "JNTools/Category/*.{h,m}"
  end
  s.subspec 'Define' do |subDefine|
    subDefine.source_files = "JNTools/Define/*.h"
  end
  s.subspec 'JNTool' do |subJNTool|
    subJNTool.source_files = "JNTools/JNTool/*.{h,m}"
  end  
end
