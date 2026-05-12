import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class TopicCard extends StatelessWidget {
   TopicCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.progress,
     required this.image,
     this.onTap
  });
  final String image;
  final String title;
  final String subtitle;
  final double progress;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding:  EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: Color(0XFF111827),
          borderRadius: BorderRadius.circular(24),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
               CircleAvatar(
                child: Image.asset(image, fit: BoxFit.cover, height: 50, width: 50,),
                backgroundColor: Colors.grey.shade900,
                radius: 18,
              ),
             Spacer(),
            Text(
              title,
              style: GoogleFonts.workSans(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
             SizedBox(height: 4),
            Text(
              subtitle,
              style: GoogleFonts.workSans(
                color: Colors.grey,
              ),
            ),
             SizedBox(height: 20),
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: LinearProgressIndicator(
                value: progress,
                minHeight: 7,
                backgroundColor: Colors.white10,
              ),
            ),

             SizedBox(height: 8),

            Align(
              alignment: Alignment.centerRight,
              child: Text(
                "${(progress * 100).toInt()}%",
                style: GoogleFonts.acme(
                  color: Colors.grey,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}