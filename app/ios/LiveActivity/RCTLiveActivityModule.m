#import "React/RCTBridgeModule.h"

@interface RCT_EXTERN_MODULE(RCTLiveActivityModule, NSObject)

RCT_EXTERN_METHOD(startNotification
                  :(NSString *) restaurant
                  :(NSString *) order
                  :(NSString *) status
                  :(NSString *) description
                  :(CGFloat *) step
                  :(NSString *) stepMessage
                  :(NSString *) imageStep
                  )

RCT_EXTERN_METHOD(updateNotification
                  :(NSString *) status
                  :(NSString *) description
                  :(CGFloat *) step
                  :(NSString *) stepMessage
                  :(NSString *) imageStep
                  )

RCT_EXTERN_METHOD(cancelNotification
                  :(NSString *) status
                  :(NSString *) description
                  :(CGFloat *) step
                  :(NSString *) stepMessage
                  :(NSString *) imageStep
                  )
@end

