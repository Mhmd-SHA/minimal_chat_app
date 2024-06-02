import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:minimal_chat_app/provider/auth_provider.dart';
import 'package:minimal_chat_app/firebase_options.dart';
import 'package:minimal_chat_app/provider/chat_provider.dart';

import 'package:minimal_chat_app/utils/themes/light_theme.dart';
import 'package:minimal_chat_app/view/pages/auth_gate.dart';
import 'package:minimal_chat_app/view/pages/login_page.dart';
import 'package:minimal_chat_app/view/pages/tab_page.dart';

import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => AuthProvider(),
    ),
    ChangeNotifierProvider(
      create: (context) => ChatProvider(),
    )
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter APP',
      theme: lightTheme,
      darkTheme: darkTheme,
      home: Consumer<AuthProvider>(
        builder: (context, value, child) {
          if (value.firebaseAuth.currentUser != null) {
            return TabPage();
          } else {
            return LoginPage();
          }
        },
      ),
      // home: AuthGate(),
    );
  }
}
