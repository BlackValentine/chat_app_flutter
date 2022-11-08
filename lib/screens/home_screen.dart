import 'package:chat_app/models/message_model.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 8,
        leading: IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
        title: const Text("Inbox"),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.search))],
      ),
      body: ListView.builder(
        itemCount: chats.length,
        itemBuilder: (BuildContext context, int index) {
          final Message chat = chats[index];
          return Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: Row(
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.all(2.0),
                    decoration: chat.unread
                        ? BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(40.0)),
                            border: Border.all(width: 2, color: Colors.teal),
                            boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 2,
                                  blurRadius: 5,
                                )
                              ])
                        : BoxDecoration(shape: BoxShape.circle, boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 5,
                            )
                          ]),
                    child: CircleAvatar(
                        radius: 35,
                        backgroundImage: AssetImage(chat.sender.imageUrl)),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.7,
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(children: [
                              Text(
                                chat.sender.name,
                                style: const TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              chat.sender.isOnline
                                  ? Container(
                                      margin: const EdgeInsets.only(left: 5.0),
                                      width: 5,
                                      height: 5,
                                      decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.blue),
                                    )
                                  : Container(),
                            ]),
                            Text(chat.time,
                                style: const TextStyle(
                                    fontSize: 11,
                                    fontWeight: FontWeight.w300,
                                    color: Colors.black54))
                          ],
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          child: Text(
                            chat.text,
                            style: const TextStyle(
                                fontSize: 13, color: Colors.black54),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ));
        },
      ),
    );
  }
}
