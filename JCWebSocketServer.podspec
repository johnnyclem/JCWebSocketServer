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
  s.source       = { :git => "https://github.com/johnnyclem/JCWebSocketServer.git", :commit => "97bc673c0bdf29eca8f405d8863a7374bbf54192" }
  s.platform     = :osx, '10.8'
  s.source_files = '*.{h,m}'
  s.exclude_files = 'Classes/Exclude'
  s.requires_arc = true
  s.dependency 'CocoaAsyncSocket', '~> 7.3.1'
end
