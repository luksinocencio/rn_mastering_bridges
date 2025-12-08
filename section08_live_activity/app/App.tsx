import { Button, NativeModules, StyleSheet, View } from 'react-native';

function App() {
  const { LiveActivityModule } = NativeModules;
  return (
    <View style={styles.container}>
      <Button
        title="Start Notification"
        onPress={() => LiveActivityModule.startNotification()}
      />
      <Button
        title="Update Notification"
        onPress={() => LiveActivityModule.updateNotification()}
      />
      <Button
        title="Cancel Notification"
        onPress={() => LiveActivityModule.cancelNotification()}
      />
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    alignItems: 'center',
    justifyContent: 'center',
  },
});

export default App;
