import 'package:easy_localization/easy_localization.dart';
import 'package:feature/screen/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:user_app/screen/home/home_screen.dart';
import 'package:user_app/user_injection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupInjection(dev);
  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en', 'US')],
      fallbackLocale: const Locale('en', 'US'),
      path: 'packages/feature/assets/translations',
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        home: LoginScreen(
          onSignInSuccess: (context) {
            Navigator.push(
              context,
              MaterialPageRoute<void>(builder: (BuildContext context) => HomeScreen()),
            );
          },
        ));
  }
}
