import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:minimal_chat_app/provider/auth_provider.dart';
import 'package:minimal_chat_app/view/pages/home_page.dart';
import 'package:minimal_chat_app/view/pages/login_page.dart';
import 'package:minimal_chat_app/view/pages/tab_page.dart';
import 'package:provider/provider.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (context, provider, child) {
        if (provider.firebaseAuth.currentUser != null) {
          return TabPage();
        } else {
          return LoginPage();
        }
        return Scaffold(
          body: StreamBuilder(
            stream: provider.firebaseAuth.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return TabPage();
              } else {
                return LoginPage();
              }
            },
          ),
        );
      },
    );
  }
}
