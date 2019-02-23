#
# Be sure to run `pod lib lint TIFormInputView.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'TIFormInputView'
  s.version          = '0.2.0'
  s.summary          = 'Extended input view for the form with additional validation (step-by-step) and error handling.'
  s.swift_version    = '4.2'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
Extended input view with animated title, text field, error text and additional fields to indicate whether the individual validation steps have been met.
                       DESC

  s.homepage         = 'https://github.com/wachus77/TIFormInputView'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Tomasz Iwaszek' => 'wachus77@gmail.com' }
  s.source           = { :git => 'https://github.com/wachus77/TIFormInputView.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '9.0'

  s.source_files = 'TIFormInputView/Classes/**/*'
  
  s.resource_bundles = {
     'TIFormInputView' => ['TIFormInputView/Classes/**/*.{xib,xcassets,json,imageset,png}']
  }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
