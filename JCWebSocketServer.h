// Originally created by Max Howell in October 2011.
// This class is in the public domain.
//
// JCWebSocketServer accepts client connections as soon as it is instantiated.
// Implementated against: http://tools.ietf.org/id/draft-ietf-hybi-thewebsocketprotocol-10

#import "GCDAsyncSocket.h"

@protocol JCWebSocketServerDelegate;


@interface JCWebSocketServer : NSObject {
    GCDAsyncSocket *socket;
    NSMutableArray *connections;
}

- (id)initWithPort:(NSUInteger)port delegate:(id<JCWebSocketServerDelegate>)delegate;

// Sends this data to all open connections. The object must respond to
// webSocketFrameData. We provide implementations for NSData and NSString.
// You may like to, eg: provide implementations for NSDictionary, encoding into a
// JSON string before calling [NSString webSocketFrameData].
- (void)send:(id)object;

@property (nonatomic, readonly) NSUInteger port;
@property (nonatomic, weak) id<JCWebSocketServerDelegate> delegate;
@property (nonatomic, readonly) NSUInteger clientCount;
@end


@protocol JCWebSocketServerDelegate
- (void)webSocketServer:(JCWebSocketServer *)webSocketServer didAcceptConnection:(GCDAsyncSocket *)connection;
- (void)webSocketServer:(JCWebSocketServer *)webSocketServer clientDisconnected:(GCDAsyncSocket *)connection;
- (void)webSocketServer:(JCWebSocketServer *)webSocket didReceiveData:(NSData *)data fromConnection:(GCDAsyncSocket *)connection;

// Data is passed to you as it was received from the socket, ie. with header & masked
// We disconnect the connection immediately after your delegate call returns.
// This always disconnect behavior sucks and should be fixed, but requires more
// intelligent error handling, so feel free to fix that.
- (void)webSocketServer:(JCWebSocketServer *)webSocketServer couldNotParseRawData:(NSData *)rawData fromConnection:(GCDAsyncSocket *)connection error:(NSError *)error;
@end


@interface GCDAsyncSocket (JCWebSocketServer)
- (void)writeWebSocketFrame:(id)object;
@end


@interface NSData (JCWebSocketServer)
- (NSData *)webSocketFrameData;
@end
