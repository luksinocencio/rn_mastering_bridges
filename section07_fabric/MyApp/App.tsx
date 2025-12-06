import { useEffect, useRef } from 'react';
import { EventSubscription, StyleSheet, Text, View } from 'react-native';
import { SafeAreaProvider } from 'react-native-safe-area-context';

import NativeRTNExample from 'rtn-example';
import BtnComponent from './src/components/BtnComponent';

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
        <BtnComponent
          title="printMessage"
          onPress={() => NativeRTNExample?.printMessage()}
        />
        <BtnComponent
          title="returnMessage"
          onPress={async () => {
            const message = await NativeRTNExample?.returnMessage();
            console.log(message);
          }}
        />
        <BtnComponent
          title="paramsFunction"
          onPress={async () => {
            const message = await NativeRTNExample?.paramsFunction('Lucas', 33);
            console.log(message);
          }}
        />
        <BtnComponent
          title="emitFunction"
          onPress={() => NativeRTNExample?.emmiterFunction()}
        />

        <BtnComponent
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
