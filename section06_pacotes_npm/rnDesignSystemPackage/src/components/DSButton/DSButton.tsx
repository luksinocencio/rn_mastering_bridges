import React from 'react';
import {
  ActivityIndicator,
  StyleSheet,
  TouchableOpacity,
  TouchableOpacityProps,
} from 'react-native';
import { DSText } from '../DSText/DSText';

export type DSButtonProps = {
  title: string;
  loading?: boolean;
  disabled?: boolean;
} & TouchableOpacityProps;

type DSButtonStyleProps = Pick<DSButtonProps, 'disabled'>;

export function DSButton({
  onPress,
  title,
  disabled,
  style,
  loading,
  ...rest
}: DSButtonProps) {
  const myStyles = styles({ disabled });

  return (
    <TouchableOpacity
      onPress={onPress}
      disabled={disabled}
      {...rest}
      style={[myStyles.button, style]}
    >
      {loading ? (
        <ActivityIndicator />
      ) : (
        <DSText preset="paragraphMedium" style={myStyles.title}>
          {title}
        </DSText>
      )}
    </TouchableOpacity>
  );
}

const styles = ({ disabled }: DSButtonStyleProps) =>
  StyleSheet.create({
    button: {
      width: '100%',
      height: 70,
      alignItems: 'center',
      justifyContent: 'center',
      backgroundColor: disabled ? '#b3b3b3' : '#0277BD',
      padding: 12,
      borderRadius: 12,
    },
    title: {
      color: 'white',
    },
  });
