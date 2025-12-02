import { TurboModule, TurboModuleRegistry } from 'react-native';

export interface Spec extends TurboModule {
  printMessage: () => void;
}

export default TurboModuleRegistry.get<Spec>('RTNExample') as Spec;
