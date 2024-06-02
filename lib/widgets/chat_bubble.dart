import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:google_fonts/google_fonts.dart';

class ChatBubble extends StatefulWidget {
  ChatBubble({super.key});

  @override
  State<ChatBubble> createState() => _ChatBubbleState();
}

class _ChatBubbleState extends State<ChatBubble> {
  TextEditingController messageController = TextEditingController();

  bool isShown = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("widget.userdata['email']"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(2),
              height: 30,
              // alignment: Alignment.centerLeft,

              // padding: EdgeInsets.symmetric(
              //     horizontal: 10, vertical: 10),
              decoration: BoxDecoration(
                  color: Colors.amber, borderRadius: BorderRadius.circular(15)),
              child: Align(
                // alignment: Alignment.centerLeft,
                child: Text(
                  "MessageData['message']",
                  // textAlign:
                  //     isRight ? TextAlign.right : TextAlign.left,
                ),
              ),
            ),

            //
            // Expanded(
            //   child: StreamBuilder(
            //     stream: chatProvider.getMessages(
            //         SenderId: chatProvider.firebaseAuth.currentUser!.uid,
            //         ReciverId: widget.userdata['uid']),
            //     builder: (context, snapshot) {
            //       if (snapshot.hasError) {
            //         return Text("${snapshot.error}");
            //       }
            //       if (!snapshot.hasData) {}
            //       // if (snapshot.connectionState == ConnectionState.waiting) {
            //       //   return Center(
            //       //     child: CircularProgressIndicator(),
            //       //   );
            //       // }
            //       if (snapshot.hasData) {
            //         // return ListView(
            //         //   children: [
            //         //     ...snapshot.data!.docs.map(
            //         //       (e) {
            //         //         final chat = e.data() as Map<String, dynamic>;
            //         //         print(chat['message']);
            //         //         return ChatBubble(chatData: chat);
            //         //       },
            //         //     ).toList(),
            //         //   ],
            //         // );

            //         return Center(
            //           child: ListView.builder(
            //               // padding: EdgeInsets.all(15),
            //               shrinkWrap: true,
            //               itemCount: snapshot.data!.docs.length,
            //               itemBuilder: (context, index) {
            //                 final MessageData = snapshot.data!.docs[index]
            //                     .data() as Map<String, dynamic>;

            //                 bool isRight = MessageData['senderId'] ==
            //                     chatProvider.firebaseAuth.currentUser!.uid;
            //                 return Container(
            //                   margin: EdgeInsets.all(2),
            //                   height: 30,
            //                   alignment: isRight
            //                       ? Alignment.centerRight
            //                       : Alignment.centerLeft,

            //                   // padding: EdgeInsets.symmetric(
            //                   //     horizontal: 10, vertical: 10),
            //                   decoration: BoxDecoration(
            //                       color: Colors.amber,
            //                       borderRadius: BorderRadius.circular(15)),
            //                   child: Align(
            //                     alignment: isRight
            //                         ? Alignment.centerRight
            //                         : Alignment.centerLeft,
            //                     child: Text(
            //                       MessageData['message'],
            //                       // textAlign:
            //                       //     isRight ? TextAlign.right : TextAlign.left,
            //                     ),
            //                   ),
            //                 );
            //               }),
            //         );
            //       }
            //       return SizedBox();
            //     },
            //   ),
            // ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: TextFormField(
                controller: messageController,
                onChanged: (value) {
                  if (value.isEmpty) {
                    isShown = false;
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
                      // if (messageController.text.isNotEmpty) {
                      //   chatProvider.sendMessage(
                      //       messageContent: messageController.text,
                      //       reciverId: widget.userdata['uid']);
                      //   messageController.clear();
                      // }
                    },
                    icon: isShown!
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
                  color: Theme.of(context).colorScheme.primary,
                ),
                autovalidateMode: AutovalidateMode.onUserInteraction,
              ),
            )
            // _chatListScreen( ),
          ],
        ),
      ),
    );
  }
}
