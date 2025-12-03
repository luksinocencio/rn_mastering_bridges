#import <Foundation/Foundation.h>
#import "RTNExample.h"
#import "rtnexample-Swift.h"

@implementation RTNExample {
  Example *example;
}

- (instancetype)init {
  if ((self = [super init])) {
    example = [[Example alloc] init];
  }
  return self;
}

RCT_EXPORT_MODULE(Example)

Example *example = [[Example alloc] init];

- (std::shared_ptr<facebook::react::TurboModule>)getTurboModule:(const facebook::react::ObjCTurboModule::InitParams &)params {
  return std::make_shared<facebook::react::NativeRTNExampleSpecJSI>(params);
}

RCT_EXPORT_METHOD(printMessage) {
  [example printMessage];
}

- (void)returnMessage:(nonnull RCTPromiseResolveBlock)resolve reject:(nonnull RCTPromiseRejectBlock)reject { 
  NSString *result = [example returnMessage];
  
  if (result != nil) {
    resolve(result);
  } else {
    NSError *error = [NSError errorWithDomain:@"RTNExample"
                                         code:0
                                     userInfo:@{NSLocalizedDescriptionKey: @"Result was nil"}];
    reject(@"no_result", @"Result was nil", error);
  }
}


@end
