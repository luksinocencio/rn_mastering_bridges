import { StyleSheet, View } from 'react-native';
import NativeLiveActivity from './specs/NativeLiveActivity';
import BtnComponent from './src/components/BtnComponent';

function App() {
  // console.log(NativeLiveActivity);
  return (
    <View style={styles.container}>
      <BtnComponent
        title="Start Notification"
        onPress={() =>
          NativeLiveActivity.startNotification(
            'McDonalds',
            '#1708',
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
          setTimeout(() => {
            NativeLiveActivity.updateNotification(
              'Seu burgão saiu para entrega',
              'Nos avalie e ganhe 10% de desconto',
              2,
              'Ufaaa... Finalmente',
              'delivery',
            );
          }, 3000)
        }
        preset="update"
      />

      <BtnComponent
        title="Cancel Notification"
        onPress={() =>
          NativeLiveActivity.cancelNotification(
            'Agora é so aproveitar',
            'Não esqueça de nos avaliar',
            3,
            'Cheguei!!',
            'delivered',
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
