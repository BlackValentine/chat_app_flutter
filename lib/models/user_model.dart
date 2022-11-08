class User {
  final int id;
  final String name;
  final String imageUrl;
  final bool isOnline;

  User(
      {required this.id,
      required this.name,
      required this.imageUrl,
      required this.isOnline});
}

//current user - YOU
final User currentUser = User(
    id: 0,
    name: "Chelsea",
    imageUrl: 'assets/images/chelsea.png',
    isOnline: true);

//list users
final User spiderMan = User(
    id: 1,
    name: "Spider Man",
    imageUrl: "assets/images/spider-man.jpg",
    isOnline: true);

final User scarletWitch = User(
    id: 2,
    name: "Scarlet Witch",
    imageUrl: "assets/images/scarlet-witch.jpg",
    isOnline: false);

final User blackWidow = User(
    id: 3,
    name: "Black Widow",
    imageUrl: "assets/images/black-widow.jpg",
    isOnline: true);

final User thor = User(
    id: 4, name: "Thor", imageUrl: "assets/images/thor.jpg", isOnline: true);

final User captainAmerican = User(
    id: 5,
    name: "Captain American",
    imageUrl: "assets/images/captain-american.jpeg",
    isOnline: false);

final User thanos = User(
    id: 6,
    name: "Thanos",
    imageUrl: "assets/images/thanos.jpg",
    isOnline: true);

final User wonderWomen = User(
    id: 7,
    name: "Wonder Women",
    imageUrl: "assets/images/wonder-women.jpg",
    isOnline: false);
