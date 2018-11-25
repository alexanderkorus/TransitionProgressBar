#
# Be sure to run `pod lib lint TransitionProgressBar.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'TransitionProgressBar'
  s.version          = '0.1.0'
  s.summary          = 'A simple two state progress bar with a transition between both states'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
A simple two state progress bar with a transition between both states.
                       DESC

  s.homepage         = 'https://github.com/alexanderkorus/TransitionProgressBar'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'alexanderkorus' => 'alexander.korus@svote.io' }
  s.source           = { :git => 'https://github.com/alexanderkorus/TransitionProgressBar.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '10.0'

  s.source_files = 'TransitionProgressBar/Classes/**/*'
  
  # s.resource_bundles = {
  #   'TransitionProgressBar' => ['TransitionProgressBar/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  s.dependency 'SnapKit', '~> 4.2.0'
  
  s.swift_version = '4.2'
end
