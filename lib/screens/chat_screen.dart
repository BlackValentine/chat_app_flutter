import 'package:chat_app/models/message_model.dart';
import 'package:chat_app/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key, required this.user}) : super(key: key);

  final User user;

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _myController = TextEditingController();
  _chatBubble(Message message, bool isMe, bool isSameUser) {
    if (isMe) {
      return Column(
        children: <Widget>[
          Container(
            alignment: Alignment.topRight,
            child: Container(
                constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width * 0.8),
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                    color: Colors.pink,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 5)
                    ]),
                child: Text(
                  message.text,
                  style: const TextStyle(color: Colors.white),
                )),
          ),
          !isSameUser
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      message.time,
                      style:
                          const TextStyle(fontSize: 12, color: Colors.black45),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 5.0),
                      decoration:
                          BoxDecoration(shape: BoxShape.circle, boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 5,
                        )
                      ]),
                      child: CircleAvatar(
                          radius: 15,
                          backgroundImage: AssetImage(currentUser.imageUrl)),
                    ),
                  ],
                )
              : Container(),
        ],
      );
    } else {
      return Column(
        children: <Widget>[
          Container(
            alignment: Alignment.topLeft,
            child: Container(
                constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width * 0.8),
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 5)
                    ]),
                child: Text(
                  message.text,
                  style: const TextStyle(color: Colors.black54),
                )),
          ),
          !isSameUser
              ? Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(right: 5.0),
                      decoration:
                          BoxDecoration(shape: BoxShape.circle, boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 5,
                        )
                      ]),
                      child: CircleAvatar(
                          radius: 15,
                          backgroundImage: AssetImage(widget.user.imageUrl)),
                    ),
                    Text(
                      message.time,
                      style:
                          const TextStyle(fontSize: 12, color: Colors.black45),
                    )
                  ],
                )
              : Container(),
        ],
      );
    }
  }

  _sendMessageArea() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8),
      height: 70,
      color: Colors.white,
      child: Row(children: <Widget>[
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.photo),
          iconSize: 25,
          color: Colors.pink,
        ),
        Expanded(
          child: TextField(
            controller: _myController,
            decoration:
                const InputDecoration.collapsed(hintText: "Send a message..."),
            textCapitalization: TextCapitalization.sentences,
          ),
        ),
        IconButton(
          onPressed: () {
            debugPrint(_myController.text);
          },
          icon: const Icon(Icons.send),
          iconSize: 25,
          color: Colors.pink,
        )
      ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    int prevUserId = 0;
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle:
            const SystemUiOverlayStyle(statusBarBrightness: Brightness.dark),
        centerTitle: true,
        title: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(children: [
              TextSpan(
                  text: widget.user.name,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w500)),
              const TextSpan(text: "\n"),
              widget.user.isOnline
                  ? const TextSpan(
                      text: "Online",
                      style:
                          TextStyle(fontSize: 11, fontWeight: FontWeight.w400))
                  : const TextSpan(text: "Offline")
            ])),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios)),
      ),
      body: Column(children: <Widget>[
        Expanded(
          child: ListView.builder(
              reverse: true,
              padding: const EdgeInsets.all(20),
              itemCount: messages.length,
              itemBuilder: (BuildContext content, int index) {
                final Message message = messages[index];
                final bool isMe = message.sender.id == currentUser.id;
                final bool isSameUser = prevUserId == message.sender.id;
                prevUserId = message.sender.id;
                return _chatBubble(message, isMe, isSameUser);
              }),
        ),
        _sendMessageArea()
      ]),
    );
  }
}
