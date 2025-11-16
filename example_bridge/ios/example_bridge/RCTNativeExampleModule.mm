#import "React/RCTBridgeModule.h"

@interface RCT_EXTERN_MODULE(RCTNativeExampleModule, NSObject)

RCT_EXTERN_METHOD(printMessage: (NSString *) name: (NSNumber *) age)
RCT_EXTERN_METHOD(
  returnMessage:
  (NSString *)title
  resolver:
  (RCTPromiseResolveBlock)resolve
  rejecter:
  (RCTPromiseRejectBlock)reject
)
RCT_EXTERN_METHOD(eventMessage: (CGFloat *) value)

@end
