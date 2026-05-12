import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuizzPage extends StatefulWidget {
  const QuizzPage({super.key, required this.progress, required this.title});
  final double progress;
  final String title;
  @override
  State<QuizzPage> createState() => _QuizzPageState();
}

class _QuizzPageState extends State<QuizzPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0XFF101622),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios_new_outlined, color: Colors.white),
        ),
        title: Text(
          widget.title,
          style: GoogleFonts.workSans(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(CupertinoIcons.question_circle, color: Colors.white),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  "Question 7 of 10",
                  style: GoogleFonts.workSans(fontSize: 18, color: Colors.grey),
                ),
                Spacer(),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "${(widget.progress * 100).toInt()}%",
                    style: GoogleFonts.acme(color: Colors.blueAccent),
                  ),
                ),
              ],
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: LinearProgressIndicator(
                value: widget.progress,
                minHeight: 7,
                backgroundColor: Colors.white10,
              ),
            ),
            SizedBox(height: 10,),
            Text("What will be printed to the console\nwhen this build method executes?", style: GoogleFonts.workSans(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),),
            SizedBox(height: 10,),
            Image.asset("assets/images/div.rounded-xl.png", fit: BoxFit.cover, width: double.infinity, height: 100,),
          ],
        ),
      ),
    );
  }
}
