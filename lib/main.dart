import 'package:flutter/material.dart';

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
                Text(
                  "Nazam Muhammad",
                  style: TextStyle(
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
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
            sectionTitleText("About me"),
            aboutRow(icon: Icons.house, text: 'Molenbeek-Saint-Jean, Belgium'),
            aboutRow(icon: Icons.work, text: 'FullStack Web Dev'),
            aboutRow(icon: Icons.favorite, text: 'Coding, Pancake'),
            Divider(
              thickness: 2,
            ),
            sectionTitleText("Friends"),
            allFriends(width / 3.5),
            Divider(
              thickness: 2,
            ),
            sectionTitleText("My Posts"),
            post(
                time: "5 minutes",
                image: "img/carnaval.jpg",
                desc:
                    "Hello world from pancake world, loved it so much. I highly recommend it to you !!!!"
            ),
            post(
              time: "2 days",
              image: "img/mountain.jpg",
              desc:
                  "This mountains is amazingly big, I feel like a worm in front of it",
              likes: 38,

            ),
            post(
                time: "1 week",
                image: "img/work.jpg",
                desc:
                    "Back to office after 1 year of lockdown, it feels so great to see your team face to face again !",
              likes: 12,
              comments: 2,
            ),post(
                time: "5 years",
                image: "img/playa.jpg",
                desc:
                    "Remote Work is so cooool, here is my home office for next weeks !",
              likes: 233,
              comments: 89,
            ),
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

  Widget sectionTitleText(String text) {
    return Padding(
      padding: EdgeInsets.all(5),
      child: Text(
        text,
        style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
      ),
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

  Container post(
      {required String time,
      required String image,
      required String desc,
      int likes = 0,
      int comments = 0}) {
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
              Text("Nazam Muhammad"),
              Spacer(),
              timeText(time)
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 8, bottom: 8),
            child: Image.asset(
              image,
              fit: BoxFit.fitWidth,
            ),
          ),
          Text(
            desc,
            style: TextStyle(color: Colors.blueAccent),
            textAlign: TextAlign.center,
          ),
          Divider(),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(Icons.favorite),
              Text("$likes Likes"),
              Icon(Icons.message),
              Text("$comments Comments"),
            ],
          )
        ],
      ),
    );
  }

  Text timeText(String time) {
    return Text("$time ago", style: TextStyle(color: Colors.blue));
  }
}
