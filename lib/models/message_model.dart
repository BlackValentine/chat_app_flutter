import 'package:chat_app/models/user_model.dart';

class Message {
  final User sender;
  final String time;
  final String text;
  final bool unread;

  Message(
      {required this.sender,
      required this.time,
      required this.text,
      required this.unread});
}

List<Message> chats = [
  Message(
      sender: spiderMan,
      time: "5:30 PM",
      text: "Hey dude! Even dead You're still the hero. Love you 3000!!!",
      unread: true),
  Message(
      sender: scarletWitch,
      time: "4:30 PM",
      text: "I'm powerful",
      unread: false),
  Message(
      sender: blackWidow,
      time: "3:30 PM",
      text: "Hey, how's it going? What did you do today?",
      unread: true),
  Message(
      sender: thor,
      time: "2:30 PM",
      text: "WOW! This sould is amazing, but miss you guys.",
      unread: true),
  Message(
      sender: captainAmerican,
      time: "1:30 PM",
      text: "Please help me to hide my identity.",
      unread: false),
  Message(
      sender: thanos,
      time: "1:30 AM",
      text: "Destroy everything!",
      unread: true),
  Message(
      sender: wonderWomen,
      time: "5:30 AM",
      text: "Beautiful women",
      unread: false),
];

// EXAMPLE MESSAGES IN CHAT SCREEN
List<Message> messages = [
  Message(
    sender: wonderWomen,
    time: '5:30 PM',
    text: 'Hey dude! Event dead I\'m the hero. Love you 3000 guys.',
    unread: true,
  ),
  Message(
    sender: currentUser,
    time: '4:30 PM',
    text: 'We could surely handle this mess much easily if you were here.',
    unread: true,
  ),
  Message(
    sender: wonderWomen,
    time: '3:45 PM',
    text: 'Take care of peter. Give him all the protection & his aunt.',
    unread: true,
  ),
  Message(
    sender: wonderWomen,
    time: '3:15 PM',
    text: 'I\'m always proud of her and blessed to have both of them.',
    unread: true,
  ),
  Message(
    sender: currentUser,
    time: '2:30 PM',
    text:
        'But that spider kid is having some difficulties due his identity reveal by a blog called daily bugle.',
    unread: true,
  ),
  Message(
    sender: currentUser,
    time: '2:30 PM',
    text:
        'Pepper & Morgan is fine. They\'re strong as you. Morgan is a very brave girl, one day she\'ll make you proud.',
    unread: true,
  ),
  Message(
    sender: currentUser,
    time: '2:30 PM',
    text: 'Yes Tony!',
    unread: true,
  ),
  Message(
    sender: wonderWomen,
    time: '2:00 PM',
    text: 'I hope my family is doing well.',
    unread: true,
  ),
];
