#import <Foundation/Foundation.h>
#import "RTNExample.h"

@implementation RTNExample

RCT_EXPORT_MODULE(Example)

- (std::shared_ptr<facebook::react::TurboModule>)getTurboModule:(const facebook::react::ObjCTurboModule::InitParams &)params { 
  return std::make_shared<facebook::react::NativeRTNExampleSpecJSI>(params);
}

- (void)printMessage { 
  NSLog(@"My message with turbo modulde");
}

@end
