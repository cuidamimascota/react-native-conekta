#ifndef CoreConekta_h
#define CoreConekta_h

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "Token.h"
#import "Card.h"

@interface CoreConekta : NSObject

@property (nonatomic, retain) NSString *baseURI;
@property (nonatomic, retain) NSString *publicKey;
@property (nonatomic, retain) UIViewController *delegate;

- (NSString *) deviceFingerprint;
- (void) collectDevice;

/* Resources */
- (Card *) Card;
- (Token *) Token;

@end

#endif
