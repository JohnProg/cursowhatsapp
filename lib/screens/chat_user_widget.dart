import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp/models/chat_detail_item.dart';
import 'package:whatsapp/models/chat_item.dart';
import 'package:whatsapp/models/user.dart';
import 'package:whatsapp/screens/widgets/input_text_widget.dart';
import 'package:whatsapp/screens/widgets/message_widget.dart';

class ChatUserWidget extends StatefulWidget {
  final List<ChatItem> chatItems;
  final User user;
  ChatUserWidget({this.chatItems, this.user});

  @override
  _ChatUserWidgetState createState() => _ChatUserWidgetState();
}

class _ChatUserWidgetState extends State<ChatUserWidget> {

  @override
  dispose(){
    super.dispose();
    _textEditingController.dispose();
  }

  ScrollController _controller = ScrollController();

  TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    MediaQueryData mqd = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.call),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.more_vert),
          ),
        ],
        title: Text("Usuario1"),
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage("assets/images/background.png"),
          fit: BoxFit.cover,
        )),
        child: Stack(
          children: <Widget>[
            ListView(
              children: <Widget>[
                Container(
                  height: mqd.size.height - 120.0,
                  child: ListView.builder(
                    controller: _controller,
                    shrinkWrap: true,
                    itemCount: tempChatDetailItems.length,
                    itemBuilder: (context, position) {
                      return MessageWidget(
                          chatDetailItem: tempChatDetailItems[position],
                          isSameUser: position < 1
                              ? false
                              : tempChatDetailItems[position - 1].name ==
                                  tempChatDetailItems[position].name);
                    },
                  ),
                ),
                Row(
                  children: <Widget>[
                    Container(
                      width: mqd.size.width - 60,
                      child: InputTextWidget(controller:_textEditingController),
                    ),
                    FloatingActionButton(
                      onPressed: () {
                       print( _textEditingController.text);
                       Firestore.instance.collection("messages")
                           .add({"message": _textEditingController.text});
                      },
                      heroTag: "Play",
                      mini: true,
                      child: Icon(Icons.play_arrow),
                    )
                  ],
                ),
              ],
            ),
            Positioned(
              right: 12.0,
              bottom: 50.0,
              child: FloatingActionButton(
                onPressed: () {
                  _controller.animateTo(_controller.position.maxScrollExtent,
                      duration: Duration(milliseconds: 500),
                      curve: Curves.easeIn);
                },
                backgroundColor: Color(0xFFA9A9A9),
                foregroundColor: Colors.white,
                mini: true,
                child: Icon(Icons.keyboard_arrow_down),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

List<ChatDetailItem> tempChatDetailItems = [
  ChatDetailItem(
    name: "Maximiliano",
    message: "Hola mundo",
    date: DateTime.parse("2019-01-01 05:01:12"),
    isMine: false,
    readMessage: true,
    phoneNumber: "+51 999 999 999",
    avatarUrl:
        "https://whatsappbrand.com/wp-content/themes/whatsapp-brc/images/chat-thumb-android-1.png",
  ),
  ChatDetailItem(
    name: "Ricardo Suarez Briones",
    message: "Hola a todos",
    phoneNumber: "+51 999 999 932",
    date: DateTime.parse("2019-01-02 05:01:12"),
    isMine: false,
    avatarUrl:
        "https://whatsappbrand.com/wp-content/themes/whatsapp-brc/images/chat-thumb-android-1.png",
  ),
  ChatDetailItem(
    name: "Hansy",
    message: "Hola a todos!",
    phoneNumber: "+51 999 999 959",
    date: DateTime.parse("2019-01-03 15:01:12"),
    isMine: true,
    avatarUrl:
        "https://whatsappbrand.com/wp-content/themes/whatsapp-brc/images/chat-thumb-android-1.png",
  ),
  ChatDetailItem(
    name: "Hansy",
    message: "Hola a todos!",
    phoneNumber: "+51 999 999 959",
    date: DateTime.parse("2019-01-03 15:01:12"),
    isMine: true,
    avatarUrl:
        "https://whatsappbrand.com/wp-content/themes/whatsapp-brc/images/chat-thumb-android-1.png",
  ),
  ChatDetailItem(
    name: "Hansy",
    message: "Hola a todos!",
    phoneNumber: "+51 999 999 959",
    date: DateTime.parse("2019-01-03 15:01:12"),
    isMine: true,
    avatarUrl:
        "https://whatsappbrand.com/wp-content/themes/whatsapp-brc/images/chat-thumb-android-1.png",
  ),
  ChatDetailItem(
    name: "Ricardo Suarez Briones",
    message: "Hola como estan!",
    phoneNumber: "+51 999 999 932",
    date: DateTime.parse("2019-01-03 23:01:12"),
    isMine: false,
    avatarUrl:
        "https://whatsappbrand.com/wp-content/themes/whatsapp-brc/images/chat-thumb-android-1.png",
  ),
  ChatDetailItem(
    name: "Ricardo Suarez Briones",
    message: "Hola como estan!",
    phoneNumber: "+51 999 999 932",
    date: DateTime.parse("2019-01-03 23:01:12"),
    isMine: false,
    avatarUrl:
        "https://whatsappbrand.com/wp-content/themes/whatsapp-brc/images/chat-thumb-android-1.png",
  ),
  ChatDetailItem(
    name: "Ricardo Suarez Briones",
    message: "Hola como estan!",
    phoneNumber: "+51 999 999 932",
    date: DateTime.parse("2019-01-03 23:01:12"),
    isMine: false,
    avatarUrl:
        "https://whatsappbrand.com/wp-content/themes/whatsapp-brc/images/chat-thumb-android-1.png",
  ),
  ChatDetailItem(
    name: "Maximiliano",
    message: "Hola mundo",
    date: DateTime.parse("2019-01-01 05:01:12"),
    isMine: false,
    readMessage: true,
    phoneNumber: "+51 999 999 999",
    avatarUrl:
        "https://whatsappbrand.com/wp-content/themes/whatsapp-brc/images/chat-thumb-android-1.png",
  ),
  ChatDetailItem(
    name: "Ricardo Suarez Briones",
    message: "Hola a todos",
    phoneNumber: "+51 999 999 932",
    date: DateTime.parse("2019-01-02 05:01:12"),
    isMine: false,
    avatarUrl:
        "https://whatsappbrand.com/wp-content/themes/whatsapp-brc/images/chat-thumb-android-1.png",
  ),
  ChatDetailItem(
    name: "Hansy",
    message: "Hola a todos!",
    phoneNumber: "+51 999 999 959",
    date: DateTime.parse("2019-01-03 15:01:12"),
    isMine: true,
    avatarUrl:
        "https://whatsappbrand.com/wp-content/themes/whatsapp-brc/images/chat-thumb-android-1.png",
  ),
  ChatDetailItem(
    name: "Hansy",
    message: "Hola a todos!",
    phoneNumber: "+51 999 999 959",
    date: DateTime.parse("2019-01-03 15:01:12"),
    isMine: true,
    avatarUrl:
        "https://whatsappbrand.com/wp-content/themes/whatsapp-brc/images/chat-thumb-android-1.png",
  ),
  ChatDetailItem(
    name: "Hansy",
    message: "Hola a todos!",
    phoneNumber: "+51 999 999 959",
    date: DateTime.parse("2019-01-03 15:01:12"),
    isMine: true,
    avatarUrl:
        "https://whatsappbrand.com/wp-content/themes/whatsapp-brc/images/chat-thumb-android-1.png",
  ),
  ChatDetailItem(
    name: "Ricardo Suarez Briones",
    message: "Hola como estan!",
    phoneNumber: "+51 999 999 932",
    date: DateTime.parse("2019-01-03 23:01:12"),
    isMine: false,
    avatarUrl:
        "https://whatsappbrand.com/wp-content/themes/whatsapp-brc/images/chat-thumb-android-1.png",
  ),
  ChatDetailItem(
    name: "Ricardo Suarez Briones",
    message: "Hola como estan!",
    phoneNumber: "+51 999 999 932",
    date: DateTime.parse("2019-01-03 23:01:12"),
    isMine: false,
    avatarUrl:
        "https://whatsappbrand.com/wp-content/themes/whatsapp-brc/images/chat-thumb-android-1.png",
  ),
  ChatDetailItem(
    name: "Ricardo Suarez Briones",
    message: "Hola como estan!",
    phoneNumber: "+51 999 999 932",
    date: DateTime.parse("2019-01-03 23:01:12"),
    isMine: false,
    avatarUrl:
        "https://whatsappbrand.com/wp-content/themes/whatsapp-brc/images/chat-thumb-android-1.png",
  ),
];
