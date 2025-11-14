// specs/NativeExampleModule.ts
import type { TurboModule } from 'react-native';
import { TurboModuleRegistry } from 'react-native';

export interface Spec extends TurboModule {
  printMessage(): void;
}

export default TurboModuleRegistry.getEnforcing<Spec>('NativeExampleModule');
