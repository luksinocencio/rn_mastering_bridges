// Importa o header do sistema de bridge do React Native.
// Esse arquivo contém a definição do protocolo RCTBridgeModule,
// usado para registrar módulos nativos que podem ser acessados pelo JavaScript.
#import "React/RCTBridgeModule.h"

// Declaração de um módulo nativo exposto ao React Native.
// A macro RCT_EXTERN_MODULE informa ao React Native que existe
// uma classe nativa chamada "RCTExampleModule", herdando de NSObject.
//
// Importante: a implementação real desse módulo está em Swift.
// Aqui estamos apenas expondo a assinatura do módulo para o runtime Objective-C,
// que é quem o React Native usa para registrar módulos.
@interface RCT_EXTERN_MODULE(RCTExampleModule, NSObject)

// Expõe o método printMessage ao JavaScript.
// A macro RCT_EXTERN_METHOD indica que esse método existe na implementação Swift
// e deve ser acessível via NativeModules no JS.
//
// No JavaScript, ele poderá ser chamado assim:
// NativeModules.RCTExampleModule.printMessage();
RCT_EXTERN_METHOD(printMessage: (NSString *) title: (NSNumber *) value)
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
