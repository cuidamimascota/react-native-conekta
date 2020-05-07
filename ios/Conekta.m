#import "Conekta.h"

#import <UIKit/UIKit.h>
#import "CoreConekta/CoreConekta.h"
#import <React/RCTConvert.h>
#import <React/RCTEventDispatcher.h>
#import <React/RCTView.h>
#import <React/UIView+React.h>
#import <React/RCTRootView.h>
#import <React/RCTLog.h>

@implementation Conekta
    CoreConekta *coreConekta;
    BOOL isCollected = NO;

- (dispatch_queue_t)methodQueue
{
    return dispatch_get_main_queue();
}

+ (BOOL)requiresMainQueueSetup
{
    return YES;
}

- (id)init
{
    UIViewController *controller = [[UIViewController alloc] init];

    coreConekta = [[CoreConekta alloc] init];
    [coreConekta setDelegate: controller];

    return self;
}

RCT_EXPORT_MODULE()

RCT_EXPORT_METHOD(createToken:(NSDictionary *)info
                  callback:(RCTResponseSenderBlock)successCallback
                  errorCallback:(RCTResponseSenderBlock)failureCallback)
{

    NSString *publicKey = [RCTConvert NSString:info[@"publicKey"]];
    [coreConekta setPublicKey:publicKey];

    if ( isCollected == NO ) {
        isCollected = YES;
        [coreConekta collectDevice];
    }

    NSString *cardNumber = [RCTConvert NSString:info[@"cardNumber"]];
    NSString *cardHolder = [RCTConvert NSString:info[@"name"]];
    NSString *cvc = [RCTConvert NSString:info[@"cvc"]];
    NSString *expMonth = [RCTConvert NSString:info[@"expMonth"]];
    NSString *expYear = [RCTConvert NSString:info[@"expYear"]];
    
    Card *card = [coreConekta.Card initWithNumber: cardNumber name: cardHolder cvc: cvc expMonth: expMonth expYear: expYear];
    
    Token *token = [coreConekta.Token initWithCard:card];
    
    [token createWithSuccess: ^(NSDictionary *data) {
        successCallback(@[data]);
        RCTLogInfo(@"response success");
    } andError: ^(NSDictionary *error) {
        RCTLogInfo(@"response error");
        failureCallback(@[error]);
    }];
}

@end

