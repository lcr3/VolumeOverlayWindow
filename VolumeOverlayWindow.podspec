#
# Be sure to run `pod lib lint VolumeOverlayWindow.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'VolumeOverlayWindow'
  s.version          = '0.1.0'
  s.summary          = 'A short description of VolumeOverlayWindow.'
  s.description      = 'Replace the default Volume Overlay.'
  s.homepage         = 'https://github.com/okanoryo/VolumeOverlayWindow'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'okanoryo' => 'llcoolryo@gmail.com' }
  s.source           = { :git => 'https://github.com/okanoryo/VolumeOverlayWindow.git', :tag => s.version.to_s }
  s.ios.deployment_target = '11.0'
  s.source_files = 'VolumeOverlayWindow/Classes/**/*'
end
