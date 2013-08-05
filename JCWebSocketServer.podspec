#
# Be sure to run `pod spec lint JCWebSocketServer.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# To learn more about the attributes see http://docs.cocoapods.org/specification.html
#
Pod::Spec.new do |s|
  s.name         = "JCWebSocketServer"
  s.version      = "0.0.1"
  s.summary      = "An easy to use Objective-C draft 10 websocket implementation."
  s.description  = "An easy to use Objective-C draft 10 websocket implementation." \
									 "originally forked from [MBWebSocketServer] [mbwebsocketserver]" \
									 "[mbwebsocketserver]:https://github.com/mxcl/MBWebSocketServer ."
  s.homepage     = "https://github.com/johnnyclem/JCWebSocketServer"
  s.license      = 'Apache License, Version 2.0'
  s.author       = { "John Clem" => "johnnyclem@gmail.com" }
  s.source       = { :git => "https://github.com/johnnyclem/JCWebSocketServer.git", :commit => "912aab918ba8b150e8134ebd43df6be1f85af7ed" }
  s.platform     = :osx, '10.8'
  s.source_files = '*.{h,m}'
  s.exclude_files = 'Classes/Exclude'
  s.requires_arc = true
  s.dependency 'CocoaAsyncSocket', '~> 7.3.1'
end
