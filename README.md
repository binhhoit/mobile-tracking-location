# Mobile tracking location

[Description]

# Technical architecture components
- Clean Architecture
- State management: flutter_bloc
- Dependency injection: injectable, get_it
- Network: retrofit, dio

## Run
```
    //Init Melos
    dart pub global activate melos
    melos bootstrap
    
    export PATH="$PATH":"$HOME/.pub-cache/bin"

    
    //Generate File
    melos run generate:all 

    flutter run -t user_app/main.dart
    flutter run -t driver_app/main.dart
```

### Overview
<img src="./architecture-proposal.png" style="display: block; margin-left: auto; margin-right: auto; width: 75%;"/>

### refer
1. Clean Architecture: https://github.com/ResoCoder/flutter-tdd-clean-architecture-course
2. Injectable: https://pub.dev/packages/injectable
3. Retrofit: https://pub.dev/packages/retrofit
4. Freezed: https://pub.dev/packages/freezed
