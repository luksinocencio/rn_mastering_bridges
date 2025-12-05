import { TurboModule, TurboModuleRegistry } from 'react-native';
import type { EventEmitter } from 'react-native/Libraries/Types/CodegenTypesNamespace';

export interface Spec extends TurboModule {
  printMessage: () => void;
  returnMessage: () => Promise<string>;
  paramsFunction: (name: string, age: number) => Promise<string>;
  emmiterFunction: () => void;
  readonly onValueChanged: EventEmitter<number>;
}

export default TurboModuleRegistry.get<Spec>('RTNExample') as Spec;
