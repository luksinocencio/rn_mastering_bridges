import { Button, NativeModules, StyleSheet, Text, View } from 'react-native';

function App() {
  const { ExampleModule } = NativeModules;

  console.log(ExampleModule);

  return (
    <View style={styles.container}>
      <Text>Hello Bridge React Native!</Text>
      <Button
        title="Click printMessage"
        onPress={() => ExampleModule.printMessage()}
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
