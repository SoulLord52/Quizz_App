import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizz_app/Home/QuizzPage.dart';

class ProgressCard extends StatelessWidget {
  const ProgressCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => QuizzPage(progress: .8, title: "Flutter Challenge",)),
        );
      },
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          gradient: RadialGradient(
            center:  Alignment(1.2, -1.2),
            radius: 1.6,
            colors: [
               Color(0XFF1E40AF),
               Color(0XFF0F172A),
               Color(0XFF111827),
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade800,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.local_fire_department,
                        color: Colors.orange,
                        size: 16,
                      ),
                      SizedBox(width: 6),
                      Text(
                        "12 DAY STREAK",
                        style: GoogleFonts.workSans(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),

                Spacer(),
                Text(
                  "Lvl 24",
                  style: GoogleFonts.workSans(color: Colors.white, fontSize: 18),
                ),
              ],
            ),

            SizedBox(height: 25),

            Text(
              "Daily Goal Progress",
              style: GoogleFonts.workSans(color: Colors.white, fontSize: 18),
            ),

            SizedBox(height: 8),

            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "750",
                    style: GoogleFonts.acme(
                      color: Colors.white,
                      fontSize: 42,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: " /1000 XP",
                    style: GoogleFonts.acme(color: Colors.white, fontSize: 24),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: LinearProgressIndicator(
                value: .75,
                minHeight: 10,
                backgroundColor: Colors.white10,
              ),
            ),

            SizedBox(height: 18),

            Row(
              children: [
                Expanded(
                  child: Text(
                    "Keep it up! 250 XP to next level",
                    style: GoogleFonts.workSans(color: Colors.white),
                  ),
                ),
                Text(
                  "View Stats >",
                  style: GoogleFonts.workSans(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
