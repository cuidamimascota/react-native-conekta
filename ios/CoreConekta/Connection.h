#ifndef Connection_h
#define Connection_h

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface Connection : NSObject <NSURLSessionDelegate>

@property (nonatomic, retain) NSURL *url;
@property (nonatomic, retain) NSMutableURLRequest *requestor;
@property (nonatomic, retain) NSString *apiKey;

- (id) initWithRequest: (NSMutableURLRequest *)request;
- (void) requestWithSuccess: (void(^)(NSDictionary *))successHandler andError: (void(^)(NSDictionary*))errorHandler;

@end

#endif
