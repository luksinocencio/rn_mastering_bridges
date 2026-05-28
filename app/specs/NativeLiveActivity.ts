import type { TurboModule } from 'react-native';
import { TurboModuleRegistry } from 'react-native';

export interface Spec extends TurboModule {
  startNotification(
    restaurant: string,
    order: string,
    status: string,
    description: string,
    step: number,
    stepMessage: string,
    imageStep: string,
  ): void;

  updateNotification(
    status: string,
    description: string,
    step: number,
    stepMessage: string,
    imageStep: string,
  ): void;

  cancelNotification(
    status: string,
    description: string,
    step: number,
    stepMessage: string,
    imageStep: string,
  ): void;
}

export default TurboModuleRegistry.getEnforcing<Spec>('NativeLiveActivity');
