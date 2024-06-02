import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:minimal_chat_app/provider/chat_provider.dart';
import 'package:minimal_chat_app/widgets/chat_bubble.dart';
import 'package:provider/provider.dart';

class ChatPage extends StatefulWidget {
  ChatPage({super.key, required this.userdata});
  Map<String, dynamic> userdata;

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  TextEditingController messageController = TextEditingController();

  bool isShown = false;
  FocusNode focusNode = FocusNode();
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    // focusNode.addListener(
    //   () {
    //     if (focusNode.hasFocus) {
    //       Future.delayed(
    //         Durations.long1,
    //         () => scrollDown(),
    //       );
    //     }
    //   },
    // );

    // Future.delayed(
    //   Durations.extralong4,
    //   () => scrollDown(),
    // );

    super.initState();
  }

  scrollDown() {
    scrollController.animateTo(
      scrollController.position.minScrollExtent,
      duration: Durations.long4,
      curve: Curves.fastEaseInToSlowEaseOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ChatProvider>(
      builder: (context, chatProvider, child) {
        return Scaffold(
          resizeToAvoidBottomInset: true,
          appBar: AppBar(
            title: Text(widget.userdata['email']),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                //
                Expanded(
                  child: StreamBuilder(
                    stream: chatProvider.getMessages(
                        SenderId: chatProvider.firebaseAuth.currentUser!.uid,
                        ReciverId: widget.userdata['uid']),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Text("${snapshot.error}");
                      }
                      if (!snapshot.hasData) {}
                      // if (snapshot.connectionState == ConnectionState.waiting) {
                      //   return Center(
                      //     child: CircularProgressIndicator(),
                      //   );
                      // }
                      if (snapshot.hasData) {
                        // return ListView(
                        //   children: [
                        //     ...snapshot.data!.docs.map(
                        //       (e) {
                        //         final chat = e.data() as Map<String, dynamic>;
                        //         print(chat['message']);
                        //         return ChatBubble(chatData: chat);
                        //       },
                        //     ).toList(),
                        //   ],
                        // );

                        return ListView.builder(
                            reverse: true,
                            controller: scrollController,
                            shrinkWrap: true,
                            itemCount: snapshot.data!.docs.length,
                            itemBuilder: (context, index) {
                              int itemCount = snapshot.data!.docs.length;
                              int reversedIndex = itemCount - 1 - index;

                              final MessageData =
                                  snapshot.data!.docs[reversedIndex].data()
                                      as Map<String, dynamic>;

                              bool isRight = MessageData['senderId'] ==
                                  chatProvider.firebaseAuth.currentUser!.uid;
                              return Align(
                                alignment: isRight
                                    ? Alignment.centerRight
                                    : Alignment.centerLeft,
                                child: Container(
                                  margin: EdgeInsets.all(2),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 15, vertical: 10),
                                  decoration: BoxDecoration(
                                      color: isRight
                                          ? Colors.greenAccent.shade700
                                          : Colors.blueGrey.shade200,
                                      borderRadius: BorderRadius.circular(15)),
                                  child: Text(
                                    MessageData['message'],
                                    // textAlign:
                                    //     isRight ? TextAlign.right : TextAlign.left,
                                  ),
                                ),
                              );
                            });
                      }
                      return SizedBox();
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: TextFormField(
                    // onTap: () {
                    //   Future.delayed(
                    //     Durations.extralong1,
                    //     () => scrollDown(),
                    //   );
                    // },
                    focusNode: focusNode,
                    controller: messageController,
                    onChanged: (value) {
                      print(value);
                      if (!value.isNotEmpty) {
                        setState(() {
                          isShown = false;
                        });
                      }
                      if (value.isNotEmpty) {
                        setState(() {
                          isShown = true;
                        });
                      }
                    },
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        IconlyBroken.chat,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      suffixIcon: IconButton(
                        onPressed: () {
                          // authProvider.showPassword();
                          if (messageController.text.isNotEmpty) {
                            chatProvider.sendMessage(
                                messageContent: messageController.text,
                                reciverId: widget.userdata['uid']);
                            messageController.clear();

                            Future.delayed(
                              Durations.extralong4,
                              () => scrollDown(),
                            );
                          }
                        },
                        icon: isShown
                            ? Icon(
                                IconlyBold.send,
                                color: Colors.blue,
                              )
                            : Icon(
                                IconlyBold.send,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                      ),
                      filled: true,
                      fillColor: Theme.of(context).colorScheme.secondary,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      contentPadding: EdgeInsets.symmetric(horizontal: 25),
                      hintText: 'Type a message',
                    ),
                    style: TextStyle(
                      fontFamily: GoogleFonts.poppins().fontFamily,
                    ),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                  ),
                )
                // _chatListScreen( ),
              ],
            ),
          ),
        );
      },
    );
  }
}
