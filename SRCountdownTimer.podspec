Pod::Spec.new do |s|
  s.name             = 'SRCountdownTimer'
  s.version          = '1.3'
  s.summary          = 'This is the simple circle countdown with a configurable timer for iOS.'
 
  s.description      = <<-DESC
You can simply start your countdown, pause and resume in just one line of code. Highly customizable control.
                       DESC
 
  s.homepage         = 'https://github.com/rsrbk/SRCountdownTimer'
  s.license          = { :type => 'MIT', :file => 'LICENSE.txt' }
  s.author           = { 'Ruslan Serebriakov' => 'rsrbk1@gmail.com' }
  s.source           = { :git => 'https://github.com/rsrbk/SRCountdownTimer.git', :tag => s.version.to_s }
 
  s.ios.deployment_target = '13.0'
  s.source_files = 'SRCountdownTimer/*.swift'
  s.swift_versions = '5.0'
 
end