import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tugas_besar/router.dart';

import 'features/landing/screens/landing_screen.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:tugas_besar/colors.dart';
import 'package:tugas_besar/screens/mobile_layout_screen.dart';
import 'package:tugas_besar/screens/web_layout_screen.dart';
import 'package:tugas_besar/utils/responsive_layout.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ChatApp',
      theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: backgroundColor,
          appBarTheme: const AppBarTheme(
            color: appBarColor,
          )
      ),
      onGenerateRoute: (settings) => generateRoute(settings),
      home: const LandingScreen(),
    );
  }
}
