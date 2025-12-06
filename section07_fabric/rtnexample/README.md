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

# ios
ios/*
!ios/RTNExample.h
!ios/RTNExample.mm
!ios/Example.swift

# android
android/*
!android/build.gradle
android/src/main/java/com/rtnexample/*
!android/src/main/java/com/rtnexample/ExampleModule.kt
!android/src/main/java/com/rtnexample/ExamplePackage.kt

!js
!package.json
!README.md
!rtn-example.podspec
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
