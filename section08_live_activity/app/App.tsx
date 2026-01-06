import { StyleSheet, View } from 'react-native';
import BtnComponent from './src/components/BtnComponent';
import { LiveActivityModule } from './src/native/RCTLiveActivityModule';

function App() {
  // const { LiveActivityModule } = NativeModules;

  return (
    <View style={styles.container}>
      <BtnComponent
        title="Start Notification"
        onPress={() =>
          LiveActivityModule.startNotification(
            'McDonalds',
            'Order #1708',
            'Estamos preparando seu burgão',
            'Em até 30 min seu pedido sai para entrega',
            1,
            'Boas notícias',
            'cooking',
          )
        }
        preset="start"
      />

      <BtnComponent
        title="Update Notification"
        onPress={() =>
          LiveActivityModule.updateNotification(
            'out_for_delivery',
            'Saiu para entrega',
            2,
            'A caminho',
            'step2.png',
          )
        }
        preset="update"
      />

      <BtnComponent
        title="Cancel Notification"
        onPress={() =>
          LiveActivityModule.cancelNotification(
            'canceled',
            'Seu pedido foi cancelado',
            0,
            'Cancelado',
            'step_cancel.png',
          )
        }
        preset="cancel"
      />
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    alignItems: 'center',
    justifyContent: 'center',
    gap: 5,
  },
});

export default App;
