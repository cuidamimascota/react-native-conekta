#ifndef Token_h
#define Token_h

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "Card.h"
#import "Connection.h"

@interface Token : NSObject

@property (nonatomic, retain) NSString *baseURI;
@property (nonatomic, retain) NSString* publicKey;
@property (nonatomic, retain) NSString *resourceURI;

@property (nonatomic, retain) Card* card;
@property (nonatomic, retain) NSString* deviceFingerprint;

- (id) initWithCard: (Card*) card;
- (void) setCard: (Card*) card;

- (void) createWithSuccess: (void(^)(NSDictionary *))successHandler andError: (void(^)(NSDictionary*))errorHandler;

- (NSString *) apiKeyBase64: (NSString *)api_key;

@end

#endif /* Token_h */
