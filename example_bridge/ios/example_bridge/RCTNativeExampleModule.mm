#import "React/RCTBridgeModule.h"

@interface RCT_EXTERN_MODULE(RCTNativeExampleModule, NSObject)

RCT_EXTERN_METHOD(printMessage: (NSString *) name: (NSNumber *) age)

@end
