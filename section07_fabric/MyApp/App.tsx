import { useEffect, useRef } from 'react';
import {
  Button,
  EventSubscription,
  StyleSheet,
  Text,
  View,
} from 'react-native';
import { SafeAreaProvider } from 'react-native-safe-area-context';

import NativeRTNExample from 'rtn-example';

function App() {
  const subscription = useRef<EventSubscription | null>(null);

  useEffect(() => {
    subscription.current = NativeRTNExample.onValueChanged((value: number) => {
      console.log('Value emitted: ', value);
    });
  }, []);

  return (
    <SafeAreaProvider>
      <View style={styles.container}>
        <Text>Hello World</Text>
        <Button
          title="printMessage"
          onPress={() => NativeRTNExample?.printMessage()}
        />
        <Button
          title="returnMessage"
          onPress={async () => {
            const message = await NativeRTNExample?.returnMessage();
            console.log(message);
          }}
        />
        <Button
          title="paramsFunction"
          onPress={async () => {
            const message = await NativeRTNExample?.paramsFunction('Lucas', 33);
            console.log(message);
          }}
        />
        <Button
          title="emitFunction"
          onPress={() => NativeRTNExample?.emmiterFunction()}
        />

        <Button
          title="cancelEmmitFunction"
          onPress={() => subscription.current?.remove()}
        />
      </View>
    </SafeAreaProvider>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    alignItems: 'center',
    justifyContent: 'center',
    backgroundColor: '#f5f5f5',
  },
});

export default App;
