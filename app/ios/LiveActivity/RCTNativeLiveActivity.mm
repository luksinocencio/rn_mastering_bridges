#import <React/RCTBridgeModule.h>
#import <ReactCodegen/NativeLiveActivitySpec/NativeLiveActivitySpec.h>

using namespace facebook::react;

@interface RCTLiveActivityModule : NSObject
- (void)startNotification:(NSString *)restaurant
                    order:(NSString *)order
                   status:(NSString *)status
              description:(NSString *)description
                     step:(double)step
              stepMessage:(NSString *)stepMessage
                imageStep:(NSString *)imageStep;
- (void)updateNotification:(NSString *)status
               description:(NSString *)description
                      step:(double)step
               stepMessage:(NSString *)stepMessage
                 imageStep:(NSString *)imageStep;
- (void)cancelNotification:(NSString *)status
               description:(NSString *)description
                      step:(double)step
               stepMessage:(NSString *)stepMessage
                 imageStep:(NSString *)imageStep;
@end

@interface RCTNativeLiveActivity : NativeLiveActivitySpecBase <NativeLiveActivitySpec>
@end

@implementation RCTNativeLiveActivity {
  RCTLiveActivityModule *_liveActivityModule;
}

RCT_EXPORT_MODULE(NativeLiveActivity)

- (instancetype)init
{
  if (self = [super init]) {
    _liveActivityModule = [RCTLiveActivityModule new];
  }
  return self;
}

- (dispatch_queue_t)methodQueue
{
  return dispatch_get_main_queue();
}

- (std::shared_ptr<TurboModule>)getTurboModule:(const ObjCTurboModule::InitParams &)params
{
  return std::make_shared<NativeLiveActivitySpecJSI>(params);
}

- (void)startNotification:(NSString *)restaurant
                    order:(NSString *)order
                   status:(NSString *)status
              description:(NSString *)description
                     step:(double)step
              stepMessage:(NSString *)stepMessage
                imageStep:(NSString *)imageStep
{
  [_liveActivityModule startNotification:restaurant
                                   order:order
                                  status:status
                             description:description
                                    step:step
                             stepMessage:stepMessage
                               imageStep:imageStep];
}

- (void)updateNotification:(NSString *)status
               description:(NSString *)description
                      step:(double)step
               stepMessage:(NSString *)stepMessage
                 imageStep:(NSString *)imageStep
{
  [_liveActivityModule updateNotification:status
                              description:description
                                     step:step
                              stepMessage:stepMessage
                                imageStep:imageStep];
}

- (void)cancelNotification:(NSString *)status
               description:(NSString *)description
                      step:(double)step
               stepMessage:(NSString *)stepMessage
                 imageStep:(NSString *)imageStep
{
  [_liveActivityModule cancelNotification:status
                              description:description
                                     step:step
                              stepMessage:stepMessage
                                imageStep:imageStep];
}

@end
