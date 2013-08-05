JCWebSocketServer
=================
A websocket *server implementation*, (you cannot instantiate an instance that
does not bind to a port).

This is a fork of the no-longer-maintained [MBWebSocketServer] [mbwebsocketserver]

SocketRocket is an excellent client lib for websockets in Cocoa, and CocoaAsyncSocket is an excellent lower-level implementation for websocket client/server, however the goal of this project is to make a simple-to-use Cocoa websocket server with a similar syntax/ease of use to [SocketRocket] [socketrocket]

NOTE! I have not tested it extensively and there are many old WS versions. So
you may well have to hack it to make it work. But! There is not much code.
And! I believe it is quite readable. I will help! Mail me!

Tested against recent Chrome, Safari and Firefox versions. Only tested on Mac.

If you want a client implementation, use Square’s [SocketRocket] [socketrocket].

Caveats
-------
* There's no support for fragmented frames.

Requirements
------------
* ARC or Garbage Collection
* Xcode 4.5

Example Usage
-------------
```objc
- (void)applicationDidFinishLaunching:(NSNotification *)note {
    self.ws = [[JCWebSocketServer alloc] initWithPort:13581 delegate:self];
}

- (void)webSocketServer:(JCWebSocketServer *)webSocketServer didAcceptConnection:(GCDAsyncSocket *)connection {
    NSLog(@"Connected to a client, we accept multiple connections");
}

- (void)webSocketServer:(JCWebSocketServer *)webSocket didReceiveData:(NSData *)data fromConnection:(GCDAsyncSocket *) {
    NSLog(@"%@", [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]);

    [connection writeWebSocketFrame:@"Thanks for the data!"]; // you can write NSStrings or NSDatas
}

- (void)webSocketServer:(JCWebSocketServer *)webSocketServer clientDisconnected:(GCDAsyncSocket *)connection {
    NSLog(@"Disconnected from client: %@", connection);
}

- (void)webSocketServer:(JCWebSocketServer *)webSocketServer couldNotParseRawData:(NSData *)rawData fromConnection:(GCDAsyncSocket *)connection error:(NSError *)error {
    NSLog(@"JCWebSocketServer error: %@", error);
}

```


Author
------
[John Clem] [johnnyclem]

Forked from [Max Howell][mxcl]

[socketrocket]:https://github.com/square/SocketRocket

[mbwebsocketserver]:https://github.com/mxcl/JCWebSocketServer

[johnnyclem]:http://github.com/johnnyclem

[mxcl]:http://twitter.com/mxcl
