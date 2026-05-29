import React, { useMemo } from 'react';
import {
  StyleSheet,
  Text,
  TouchableOpacity,
  type GestureResponderEvent,
} from 'react-native';

export type ButtonPreset = 'start' | 'update' | 'cancel';

type Props = {
  title: string;
  onPress?: (event: GestureResponderEvent) => void;
  preset?: ButtonPreset;
};

export default function BtnComponent({
  title,
  onPress,
  preset = 'start',
}: Props) {
  const backgroundColor = useMemo(() => {
    switch (preset) {
      case 'start':
        return '#34C759';
      case 'update':
        return '#007AFF';
      case 'cancel':
        return '#FF3B30';
      default:
        return '#34C759';
    }
  }, [preset]);

  return (
    <TouchableOpacity
      style={[styles.container, { backgroundColor }]}
      onPress={onPress}
      activeOpacity={0.8}
    >
      <Text style={styles.title}>{title}</Text>
    </TouchableOpacity>
  );
}

const styles = StyleSheet.create({
  container: {
    paddingVertical: 12,
    paddingHorizontal: 20,
    minWidth: 250,
    maxWidth: 300,
    alignItems: 'center',
    justifyContent: 'center',
    borderRadius: 8,
  },
  title: {
    fontSize: 15,
    color: '#fff',
    fontWeight: 'bold',
  },
});
