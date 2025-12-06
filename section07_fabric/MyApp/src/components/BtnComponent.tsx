import React from 'react';
import {
  StyleSheet,
  Text,
  TouchableOpacity,
  type GestureResponderEvent,
} from 'react-native';

type Props = {
  title: string;
  onPress: ((event: GestureResponderEvent) => void) | undefined;
};

export default function BtnComponent({ title, onPress }: Props) {
  return (
    <TouchableOpacity style={styles.container} onPress={onPress}>
      <Text style={styles.title}>{title}</Text>
    </TouchableOpacity>
  );
}

const styles = StyleSheet.create({
  container: {
    backgroundColor: '#6fa8dc',
    paddingVertical: 10,
    marginVertical: 5,
    minWidth: 250,
    maxWidth: 300,
    alignItems: 'center',
    justifyContent: 'center',
    borderRadius: 8,
  },
  title: {
    fontSize: 14,
    color: '#fff',
    fontWeight: 'bold',
  },
});
