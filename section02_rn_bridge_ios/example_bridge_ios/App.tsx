import { Button, NativeModules, StyleSheet, Text, View } from 'react-native';
import { SafeAreaProvider } from 'react-native-safe-area-context';

function App() {
  const { ExampleModule } = NativeModules;

  console.log(ExampleModule);

  return (
    <SafeAreaProvider>
      <View style={styles.container}>
        <Text>Hello Bridge React Native!</Text>
        <Button
          title="Click me for printMessage"
          onPress={() => ExampleModule.printMessage('Lucas', 32)}
        />

        <Button
          title="Click me for returnMessage resolve"
          onPress={() =>
            ExampleModule.returnMessage('Lucas')
              .then(result => {
                console.log(`Message from native module: ${result}`);
              })
              .catch(error => console.log(error))
          }
        />

        <Button
          title="Click me for returnMessage reject"
          onPress={() =>
            ExampleModule.returnMessage('Lua')
              .then(result => {
                console.log(`Message from native module: ${result}`);
              })
              .catch(error => console.log(error))
          }
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
