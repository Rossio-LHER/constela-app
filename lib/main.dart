import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'config/theme.dart';
import 'presentation/screens/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    const ProviderScope(
      child: ConstelaApp(),
    ),
  );
}

class ConstelaApp extends StatelessWidget {
  const ConstelaApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CONSTELA',
      theme: constelaTheme,
      home: const SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
