import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:minimal_chat_app/provider/auth_provider.dart';
import 'package:minimal_chat_app/view/pages/login_page.dart';
import 'package:minimal_chat_app/widgets/chat_bubble.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (context, authProvider, child) {
        bool isRight = true;
        return Scaffold(
            appBar: AppBar(
              title: Text(authProvider.firebaseAuth!.currentUser!.email!),
            ),
            body: Center(
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 5, horizontal: 15.0),
                    child: ListTile(
                      title: Text("Dark Mode"),
                      trailing: CupertinoSwitch(
                        activeColor: CupertinoColors.activeBlue,
                        value: authProvider.isDarkMode && context.isDarkMode,
                        onChanged: (value) {
                          authProvider.changeTheme();
                        },
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      tileColor: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                  Spacer(),
                  Spacer(),
                  ElevatedButton(
                    onPressed: () async {
                      bool signout = await authProvider.signout();
                      if (signout) {
                        Get.offAll(
                          LoginPage(),
                          transition: Transition.cupertino,
                        );
                      }
                    },
                    child: Text("signout"),
                  ),
                  Spacer(),
                ],
              ),
            ));
      },
    );
  }
}
