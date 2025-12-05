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

## Configuração no android

no build.gradle nivel projeto

```
android { 
    namespace "com.rtnexample" // colocar o nome do pacote
    compileSdkVersion = 36 // versão do projeto
}

repositories {
    google()
    mavenCentral()
}

dependencies { 
    implementation "com.facebook.react:react-native"
}
```

depois entrar na pasta android, e executar o seguinte comando:

```
./gradlew generateCodegenArtifactsFromSchema 
```
