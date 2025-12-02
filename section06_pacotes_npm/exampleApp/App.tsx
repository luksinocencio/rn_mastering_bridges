import { StyleSheet, Text, View } from 'react-native';
import { SafeAreaProvider } from 'react-native-safe-area-context';
import { DSButton } from 'rn-design-system-package';
import { multiply, sum, validateCPFNumber } from 'rn-package-math-2';

function App() {
  function validarCPF(cpf: string) {
    const isValid = validateCPFNumber(cpf);
    return isValid ? 'é valido' : 'não é valido';
  }
  return (
    <SafeAreaProvider>
      <View style={[styles.container]}>
        <Text>Hello</Text>
        <Text>30 * 30 = {multiply(30, 30)}</Text>
        <Text>30 + 30 = {sum(30, 30)}</Text>
        <Text>CPF: 47437994143 {validarCPF('47437994143')}</Text>
        <Text>CPF: 1 {validarCPF('1')}</Text>
        <DSButton
          title="teste"
          style={{ marginVertical: 10, height: 44, width: 100 }}
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
    padding: 16,
  },
});

export default App;
