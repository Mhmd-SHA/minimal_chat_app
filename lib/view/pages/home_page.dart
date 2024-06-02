import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import 'package:get/get.dart';
import 'package:minimal_chat_app/provider/auth_provider.dart';
import 'package:minimal_chat_app/provider/chat_provider.dart';

import 'package:minimal_chat_app/utils/themes/light_theme.dart';
import 'package:minimal_chat_app/view/pages/chat_page.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ChatProvider>(
      builder: (context, chatProvider, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text(chatProvider.firebaseAuth.currentUser!.email!),
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            child: StreamBuilder(
              stream: chatProvider.getUsersStream(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (snapshot.hasData) {
                  return ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    physics: BouncingScrollPhysics(),
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      final userdata = snapshot.data![index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 15.0),
                        child: ListTile(
                            onTap: () {
                              Get.to(
                                () => ChatPage(
                                  userdata: userdata,
                                ),
                              );
                            },
                            leading: Icon(
                              IconlyBold.profile,
                            ),
                            minLeadingWidth: 40,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            tileColor: Theme.of(context).colorScheme.secondary,
                            style: ListTileStyle.drawer,
                            title: Text(
                              userdata['email'],
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            )),
                      );
                      // snapshot.data!.map(
                      //   (userData) {
                      //     print(userData);
                      //     ListTile(
                      //       title: Text(
                      //         "userData['email']",
                      //         style: TextStyle(color: Colors.amber),
                      //       ),
                      //     );
                      //   },
                      // ).toList();
                    },
                  );
                }
                return SizedBox();
              },
            ),
          ),
        );
      },
    );
  }
}
