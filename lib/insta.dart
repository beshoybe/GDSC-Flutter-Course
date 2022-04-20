import 'package:flutter/material.dart';

class Insta extends StatelessWidget {
  Insta({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    List<Widget> postlist = [
      post(
          name: "Ahmed Mohamed",
          location: "Giza, Egypt",
          profileimage: "assets/man.jpg",
          image: "assets/cat.jpeg"),
      post(
          name: "GDSC NU",
          location: "Giza, Egypt",
          profileimage: 'assets/gdsc.png',
          image: 'assets/gdsc.png'),
      post(
          name: "Mohamed Mahmoud",
          location: "Cairo, Egypt",
          profileimage: 'assets/man2.jpg',
          image: 'assets/man3.jpg'),
      post(
          name: "GDSC NU",
          location: "Giza, Egypt",
          profileimage: 'assets/gdsc.png',
          image: 'assets/gdsc.png'),
    ];
    return MaterialApp(
        home: Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.white,
        backgroundColor: Colors.black,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
          BottomNavigationBarItem(
              icon: Icon(Icons.video_collection_outlined), label: "Watch"),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_bag), label: "Marketplace"),
          BottomNavigationBarItem(
              icon:
                  CircleAvatar(backgroundImage: AssetImage('assets/man2.jpg')),
              label: "Profile")
        ],
      ),
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Container(
          width: 130,
          child: Image.asset("assets/insta.png"),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.add_box_outlined)),
          IconButton(
              onPressed: () {}, icon: Icon(Icons.favorite_border_outlined)),
          IconButton(onPressed: () {}, icon: Icon(Icons.send_outlined))
        ],
      ),
      body: Container(
          padding: EdgeInsets.all(10),
          child: ListView.builder(
              itemCount: postlist.length,
              itemBuilder: (context, index) {
                return postlist[index];
              })),
    ));
  }

  Widget post(
      {required String name,
      required String location,
      required String profileimage,
      required String image}) {
    return Column(
      children: [
        Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(profileimage),
            ),
            SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(fontSize: 15, color: Colors.white),
                ),
                Text(
                  location,
                  style: TextStyle(color: Colors.white, fontSize: 10),
                )
              ],
            ),
            Spacer(),
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.more_vert_outlined,
                  color: Colors.white,
                ))
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Container(
            height: 400,
            width: 400,
            color: Colors.white,
            child: FittedBox(
              child: Image.asset(
                image,
              ),
            )),
        Row(
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.favorite_outline,
                color: Colors.white,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.comment_bank,
                color: Colors.white,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.send,
                color: Colors.white,
              ),
            ),
            Spacer(),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.bookmark,
                color: Colors.white,
              ),
            ),
          ],
        )
      ],
    );
  }
}
