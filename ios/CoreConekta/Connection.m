#include "Connection.h"

@implementation Connection

- (id) initWithRequest: (NSMutableURLRequest *)request
{
    self = [super init];
    if (!self) return nil;
    
    [self setRequestor: request];
    
    return self;
}

- (void) requestWithSuccess: (void(^)(NSDictionary *))successHandler andError: (void(^)(NSDictionary*))errorHandler
{
    NSURLSessionConfiguration *defaultConfigObject = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *defaultSession = [NSURLSession sessionWithConfiguration: defaultConfigObject
                                                                 delegate: self
                                                            delegateQueue: [NSOperationQueue mainQueue]];
    
    NSURLSessionDataTask * dataTask =[defaultSession dataTaskWithRequest:[self requestor]
                                                       completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        
        NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *) response;
        
        NSLog(@"API RESPONSE %@", error);
        NSLog(@"response status code: %ld", [httpResponse statusCode]);
        if (error == nil) {
            NSError *e = nil;
            NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&e];
         if ([httpResponse statusCode] == 200) {
             successHandler(json);
         } else {
             errorHandler(json);
         }
        }
    }];

    [dataTask resume];
}

@end
