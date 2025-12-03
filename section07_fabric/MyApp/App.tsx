import { Button, StyleSheet, Text, View } from 'react-native';
import { SafeAreaProvider } from 'react-native-safe-area-context';

import NativeRTNExample from 'rtn-example';

function App() {
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
