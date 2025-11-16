import type { TurboModule } from 'react-native';
import { TurboModuleRegistry } from 'react-native';

export interface Spec extends TurboModule {
  printMessage(name: string, age: number): void;
  returnMessage(title: string): Promise<string>;
  eventMessage(value: number): void;
  addListener(eventType: string): void;
  removeListeners(count: number): void;
}

export default TurboModuleRegistry.getEnforcing<Spec>('NativeExampleModule');
