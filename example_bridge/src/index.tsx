import React, { useEffect } from 'react';

import BtnComponent from './components/BtnComponent';

import ExampleModule from '../specs/NativeExampleModule';

import { NativeEventEmitter, StyleSheet, Text, View } from 'react-native';

function App() {
  console.log('Native module: ', ExampleModule);

  const eventEmitter = new NativeEventEmitter(ExampleModule);

  useEffect(() => {
    const subscription = eventEmitter.addListener('onMessagePrinted', event => {
      console.log('Evento recebido: ', event);
      // console.log('Evento recebido: ', event.value);
    });

    return () => {
      subscription.remove();
    };
  }, [eventEmitter]);

  return (
    <View style={styles.container}>
      <Text>Hello Bridge React Native!</Text>
      <BtnComponent
        title="Click printMessage"
        onPress={() => ExampleModule.printMessage('Lucas', 32)}
      />

      <BtnComponent
        title="Click me for returnMessage"
        onPress={() => {
          ExampleModule.returnMessage('Lucas')
            .then(value => {
              console.log('Native message returned: ' + value);
            })
            .catch(error => console.error(error));
        }}
      />

      <BtnComponent
        title="Click me for event message"
        onPress={() => ExampleModule.eventMessage(17)}
      />
    </View>
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
