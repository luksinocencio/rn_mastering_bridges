import { NativeModules } from 'react-native';

type LiveActivityModuleType = {
  startNotification(
    restaurant: string,
    order: string,
    status: string,
    decription: string,
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
};

export const LiveActivityModule =
  NativeModules.LiveActivityModule as LiveActivityModuleType;
