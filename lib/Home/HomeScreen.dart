import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizz_app/Home/QuizzPage.dart';
import 'package:quizz_app/Widgets/AppButon.dart';
import 'package:quizz_app/Widgets/HomeCardWidget.dart';

import '../Widgets/TopicCardWidget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Row(
          children: [
            CircleAvatar(backgroundColor: Color(0XFF101622), radius: 24),
            SizedBox(width: 10),
            Text(
              "Welcome back\nAlex Dev",
              style: GoogleFonts.workSans(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
        actions: [
          IconButton.filled(
            onPressed: () {},
            icon: Icon(CupertinoIcons.search),
            color: Colors.white,
            style: IconButton.styleFrom(backgroundColor: Colors.grey.shade900),
          ),
          SizedBox(width: 5),
          IconButton.filled(
            onPressed: () {
              FirebaseAuth.instance.signOut();
            },
            icon: Icon(Icons.logout),
            color: Colors.white,
            style: IconButton.styleFrom(backgroundColor: Colors.grey.shade900),
          ),
          SizedBox(width: 10),
        ],
      ),
      backgroundColor: Colors.black,
      body: Padding(
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 15),
              ProgressCard(),
              SizedBox(height: 15),
              Row(
                children: [
                  Text("Your Topics", style: GoogleFonts.workSans(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),),
                  Spacer(),
                  TextButton(onPressed: () {}, child: Text("See All", style: GoogleFonts.workSans(color: Colors.blueAccent, fontSize: 18,),)),

                ],
              ),
              SizedBox(height: 15),
              GridView.count(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 0.80,
                children: [
                  TopicCard(
                    onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context) => QuizzPage(progress: .8, title: "Flutter Challenge",)));},
                    title: "Flutter",
                    subtitle: "12/15 Puzzles",
                    progress: .8,
                    image: "assets/images/flutter.png",
                  ),
                  TopicCard(
                    onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context) => QuizzPage(progress: .45, title: "Python Challenge",)));},
                    title: "Python",
                    subtitle: "7/15 Puzzles",
                    progress: .45,
                    image: "assets/images/python.png",
                  ),
                  TopicCard(
                    onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context) => QuizzPage(progress: .20, title: "React Challenge",)));},
                    title: "React",
                    subtitle: "3/15 Puzzles",
                    progress: .20,
                    image: "assets/images/react.png",
                  ),
                  TopicCard(
                    onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context) => QuizzPage(progress: .10, title: "Go Challenge",)));},
                    title: "Go",
                    subtitle: "1/15 Puzzles",
                    progress: .10,
                    image: "assets/images/go.png",
                  ),
                ],
              ),
              SizedBox(height: 20,),
              AppButton(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => QuizzPage(progress: .8, title: "Flutter Challenge",)),
                  );
                },
                text: "Advanced Flutter Hooks >",
              ),
              SizedBox(height: 10,)
            ],
          ),
        ),
      ),
    );
  }
}
