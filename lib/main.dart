import 'package:basic_exercice/main_title_text.dart';
import 'package:basic_exercice/section_title.dart';
import 'package:flutter/material.dart';
import 'post.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BasicPage(),
    );
  }
}

class BasicPage extends StatelessWidget {

  List<Post> posts = [
    Post(
        name: "Nazam Muhammad",
        time: "5 minutes",
        imagePath: "img/carnaval.jpg",
        desc:
        "Hello world from pancake world, loved it so much. I highly recommend it to you !!!!"
    ),
    Post(
      name: "Nazam Muhammad",
      time: "2 days",
      imagePath: "img/mountain.jpg",
      desc:
      "This mountains is amazingly big, I feel like a worm in front of it",
      likes: 38,

    ),
    Post(
      name: "Nazam Muhammad",
      time: "1 week",
      imagePath: "img/work.jpg",
      desc:
      "Back to office after 1 year of lockdown, it feels so great to see your team face to face again !",
      likes: 12,
      comments: 2,
    ),
    Post(
      name: "Nazam Muhammad",
      time: "5 years",
      imagePath: "img/playa.jpg",
      desc:
      "Remote Work is so cooool, here is my home office for next weeks !",
      likes: 233,
      comments: 89,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(title: Text("Facebook Profile")),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.topCenter,
              children: [
                Image.asset(
                  'img/cover.jpg',
                  height: 200,
                  fit: BoxFit.cover,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 125),
                  child: CircleAvatar(
                      radius: 75,
                      backgroundColor: Colors.white,
                      child: myProfilPic(72)),
                ),
              ],
            ),
            Row(
              children: [
                Spacer(),
                MainTitleText(data: "Nazam Muhammad"),
                Spacer(),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                "One day, cats will take over the world but not today. Time to sleep...",
                style: TextStyle(
                  color: Colors.grey,
                  fontStyle: FontStyle.italic,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: buttonContainer(text: "Edit the profil"),
                ),
                buttonContainer(icon: Icons.border_color),
              ],
            ),
            Divider(
              thickness: 2,
            ),
            SectionTitle("About me"),
            aboutRow(icon: Icons.house, text: 'Molenbeek-Saint-Jean, Belgium'),
            aboutRow(icon: Icons.work, text: 'FullStack Web Dev'),
            aboutRow(icon: Icons.favorite, text: 'Coding, Pancake'),
            Divider(
              thickness: 2,
            ),
            SectionTitle("Friends"),
            allFriends(width / 3.5),
            Divider(
              thickness: 2,
            ),
            SectionTitle("My Posts"),
            allPosts(),

          ],
        ),
      ),
    );
  }

  CircleAvatar myProfilPic(double radius) {
    return CircleAvatar(
      radius: radius,
      backgroundImage: AssetImage('img/profile.jpg'),
    );
  }

  Container buttonContainer({IconData? icon, String? text}) {
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10),
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: Colors.blue),
      child: (icon == null)
          ? Center(
              child: Text(
              text ?? "",
              style: TextStyle(color: Colors.white),
            ))
          : Icon(icon, color: Colors.white),
      height: 50,
    );
  }


  Widget aboutRow({required IconData icon, required String text}) {
    return Row(children: [
      Icon(icon),
      Padding(
        padding: EdgeInsets.all(5),
        child: Text(text),
      ),
    ]);
  }

  Column friendsImage(String name, String imagePath, double width) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.all(5),
          width: width,
          height: width,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(imagePath), fit: BoxFit.cover),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [BoxShadow(color: Colors.grey)],
              color: Colors.blue),
        ),
        Text(name),
        Padding(padding: EdgeInsets.only(bottom: 5)),
      ],
    );
  }

  Row allFriends(double width) {
    Map<String, String> friends = {
      "John": "img/cat.jpg",
      "Magnum": 'img/sunflower.jpg',
      "Duck": 'img/duck.jpg'
    };
    List<Widget> children = [];
    friends.forEach((name, imagePath) {
      children.add(friendsImage(name, imagePath, width));
    });
    return Row(
      children: children,
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    );
  }
  Column allPosts() {
    List<Widget> postToAdd = [];
    posts.forEach((elem){
      postToAdd.add(post(post: elem));
    });

    return Column(children: postToAdd);
  }
  Container post({required Post post}) {
    return Container(
      margin: EdgeInsets.only(top: 8, right: 3, left: 3),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Color.fromRGBO(255, 255, 255, 1),
      ),
      child: Column(
        children: [
          Row(
            children: [
              myProfilPic(20),
              Padding(padding: EdgeInsets.only(left: 8)),
              Text(post.name),
              Spacer(),
              timeText(post.setTime())
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 8, bottom: 8),
            child: Image.asset(
              post.imagePath,
              fit: BoxFit.fitWidth,
            ),
          ),
          Text(
            post.desc,
            style: TextStyle(color: Colors.blueAccent),
            textAlign: TextAlign.center,
          ),
          Divider(),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(Icons.favorite),
              Text("${post.setLikes()} Likes"),
              Icon(Icons.message),
              Text("${post.setComments()} Comments"),
            ],
          )
        ],
      ),
    );
  }

  Text timeText(String time) {
    return Text("$time", style: TextStyle(color: Colors.blue));
  }
}
