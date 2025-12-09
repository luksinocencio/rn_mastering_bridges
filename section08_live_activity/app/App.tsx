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
            'Order #123',
            'preparing',
            'O pedido está sendo preparado',
            1,
            'Preparando',
            'step1.png',
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
