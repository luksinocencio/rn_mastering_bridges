Criar uma pasta na raiz do projeto `js`.
Criar um arquivo Native+NOME_DO_ARQUIVO.

```ts
import { TurboModule, TurboModuleRegistry } from 'react-native';

export interface Spec extends TurboModule {
  printMessage: () => void;
}

export default TurboModuleRegistry.get<Spec>('RTNExample') as Spec;
```

criar um arquivo `.npmignore`

```
/*

!js
!package.json
!README.md
```
